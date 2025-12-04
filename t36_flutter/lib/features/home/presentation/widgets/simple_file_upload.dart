// manifest: startProject

import 'dart:io'; // <--- ДОБАВЛЕНО
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb; // <--- ДОБАВЛЕНО
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:t36_client/t36_client.dart';
import 'package:mime/mime.dart';

class SimpleFileUpload extends StatefulWidget {
  final Client client;

  const SimpleFileUpload({super.key, required this.client});

  @override
  State<SimpleFileUpload> createState() => _SimpleFileUploadState();
}

class _SimpleFileUploadState extends State<SimpleFileUpload> {
  bool _uploading = false;
  String _status = 'Выберите файл для загрузки';

  Future<void> _uploadFile() async {
    setState(() {
      _uploading = true;
      _status = 'Выбор файла...';
    });

    try {
      // --- ИСПРАВЛЕНИЕ 1: Выбираем файл по-разному для разных платформ ---
      // Для веба мы должны загрузить данные в память (withData: true).
      // Для остальных платформ мы будем использовать путь к файлу (path).
      final result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        withData: kIsWeb, // true для веба, false для остальных
      );

      if (result == null || result.files.isEmpty) {
        setState(() {
          _status = 'Файл не выбран';
          _uploading = false;
        });
        return;
      }

      final file = result.files.first;
      final mimeType = lookupMimeType(file.name) ?? 'application/octet-stream';

      // --- ИСПРАВЛЕНИЕ 2: Получаем байты файла кроссплатформенным способом ---
      Uint8List fileBytes;
      if (kIsWeb) {
        // В вебе байты уже загружены в память
        fileBytes = file.bytes!;
      } else {
        // На мобильных/десктопе читаем файл с диска по его пути
        final filePath = file.path;
        if (filePath == null) {
          throw Exception('Не удалось получить путь к файлу.');
        }
        fileBytes = await File(filePath).readAsBytes();
      }
      
      if (fileBytes.isEmpty) {
          throw Exception('Выбранный файл пуст.');
      }

      setState(() => _status = 'Запрос разрешения...');

      final uploadRequest = await widget.client.storage.requestUpload(
        file.name,
        mimeType,
        file.size,
      );

      if (uploadRequest == null) {
        throw Exception('Сервер не выдал разрешение на загрузку');
      }

      setState(() => _status = 'Загрузка файла...');

      final response = await http.put(
        Uri.parse(uploadRequest.uploadUrl),
        headers: {'Content-Type': mimeType},
        body: fileBytes,
      );

      if (response.statusCode != 200) {
        throw Exception('Ошибка загрузки в S3: ${response.statusCode}, ${response.body}');
      }

      setState(() => _status = 'Подтверждение...');

      final confirmed = await widget.client.storage.confirmUpload(uploadRequest.fileId!);
      
      setState(() {
        _status = confirmed ? '✅ Файл "${file.name}" загружен успешно!' : '❌ Ошибка подтверждения';
        _uploading = false;
      });

    } catch (e) {
      setState(() {
        _status = '❌ Ошибка: $e';
        _uploading = false;
      });
      print('FileUpload Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_uploading) const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircularProgressIndicator(),
        ),
        Text(_status, textAlign: TextAlign.center),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _uploading ? null : _uploadFile,
          child: const Text('Выбрать и загрузить файл'),
        ),
      ],
    );
  }
}
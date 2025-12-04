// manifest: startProject
class MimeTypeHelper {
  static const Map<String, String> _extensionToMimeType = {
    // Изображения
    'jpg': 'image/jpeg',
    'jpeg': 'image/jpeg',
    'png': 'image/png',
    'gif': 'image/gif',
    'webp': 'image/webp',
    'svg': 'image/svg+xml',
    'ico': 'image/x-icon',
    'bmp': 'image/bmp',
    
    // Документы
    'pdf': 'application/pdf',
    'doc': 'application/msword',
    'docx': 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    'xls': 'application/vnd.ms-excel',
    'xlsx': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    'ppt': 'application/vnd.ms-powerpoint',
    'pptx': 'application/vnd.openxmlformats-officedocument.presentationml.presentation',
    'txt': 'text/plain',
    'csv': 'text/csv',
    'rtf': 'application/rtf',
    
    // Архивы
    'zip': 'application/zip',
    'rar': 'application/x-rar-compressed',
    '7z': 'application/x-7z-compressed',
    'tar': 'application/x-tar',
    'gz': 'application/gzip',
    
    // Видео
    'mp4': 'video/mp4',
    'avi': 'video/x-msvideo',
    'mov': 'video/quicktime',
    'wmv': 'video/x-ms-wmv',
    'flv': 'video/x-flv',
    'webm': 'video/webm',
    
    // Аудио
    'mp3': 'audio/mpeg',
    'wav': 'audio/wav',
    'ogg': 'audio/ogg',
    'm4a': 'audio/mp4',
    'flac': 'audio/flac',
  };

  /// Определяет MIME-тип по имени файла
  static String getMimeTypeFromFilename(String filename) {
    final parts = filename.toLowerCase().split('.');
    if (parts.length < 2) {
      return 'application/octet-stream';
    }
    
    final extension = parts.last;
    return _extensionToMimeType[extension] ?? 'application/octet-stream';
  }

  /// Исправляет MIME-тип, если он неопределенный
  static String fixMimeType(String mimeType, String filename) {
    // Если MIME-тип уже корректный, возвращаем его
    if (mimeType != 'application/octet-stream' && 
        mimeType.isNotEmpty && 
        !mimeType.contains('unknown')) {
      return mimeType;
    }
    
    // Иначе определяем по расширению файла
    return getMimeTypeFromFilename(filename);
  }
  
  /// Проверяет, является ли MIME-тип изображением
  static bool isImage(String mimeType) {
    return mimeType.startsWith('image/');
  }
  
  /// Проверяет, является ли MIME-тип документом
  static bool isDocument(String mimeType) {
    return mimeType.startsWith('application/pdf') ||
           mimeType.startsWith('application/msword') ||
           mimeType.startsWith('application/vnd.') ||
           mimeType.startsWith('text/');
  }
}
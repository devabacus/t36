// manifest: startProject

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../config/config.dart';
import '../services/api/api_client.dart';

part 'api_provider.g.dart';


@riverpod
ApiClient apiClient(Ref ref) {
  return ApiClient.create(apiKey: AppConfig.apiKey, baseUrl: AppConfig.baseUrl);
}


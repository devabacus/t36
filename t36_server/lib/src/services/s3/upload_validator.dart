// manifest: startProject
class UploadValidator {
  static const int maxFileSize = 10 * 1024 * 1024; // 10 MB
  static const int maxImageSize = 5 * 1024 * 1024; // 5 MB
  static const int maxDocumentSize = 10 * 1024 * 1024; // 10 MB
  
  static const Set<String> allowedImageTypes = {
    'image/jpeg',
    'image/jpg',
    'image/png',
    'image/gif',
    'image/webp',
  };
  
  static const Set<String> allowedDocumentTypes = {
    'application/pdf',
    'application/msword',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    'application/vnd.ms-excel',
    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
  };
  
  static bool isValidFile({
    required String mimeType,
    required int size,
  }) {
    // Проверка типа
    if (!allowedImageTypes.contains(mimeType) && 
        !allowedDocumentTypes.contains(mimeType)) {
      return false;
    }
    
    // Проверка размера
    if (allowedImageTypes.contains(mimeType) && size > maxImageSize) {
      return false;
    }
    
    if (allowedDocumentTypes.contains(mimeType) && size > maxDocumentSize) {
      return false;
    }
    
    return size <= maxFileSize;
  }
  
  static String getValidationError({
    required String mimeType,
    required int size,
  }) {
    if (!allowedImageTypes.contains(mimeType) && 
        !allowedDocumentTypes.contains(mimeType)) {
      return 'Тип файла не поддерживается';
    }
    
    if (size > maxFileSize) {
      return 'Файл слишком большой (максимум ${maxFileSize ~/ 1024 ~/ 1024} МБ)';
    }
    
    return 'Файл не прошел валидацию';
  }
}
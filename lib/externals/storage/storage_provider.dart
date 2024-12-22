import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:verymemo/externals/storage/storage_service.dart';

final storageProvider = Provider<StorageService>((ref) {
  final StorageServiceImpl storageService = StorageServiceImpl();
  storageService.init();

  return storageService;
});

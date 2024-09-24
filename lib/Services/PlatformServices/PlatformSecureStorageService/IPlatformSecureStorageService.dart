import 'package:fleetdrive/Helpers/APIHandler.dart';

abstract class IPlatformSecureStorageService {
  Future<ServiceResult<bool>> saveData(
      {required String key, required String value});
  Future<ServiceResult<String?>> retrieveData({required String key});
}

import 'package:fleetdrive/Helpers/APIHandler.dart';
import 'package:fleetdrive/Services/PlatformServices/PlatformSecureStorageService/IPlatformSecureStorageService.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PlatformSecureStorageService implements IPlatformSecureStorageService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  // Save a value
  Future<ServiceResult<bool>> saveData({
    required String key,
    required String value,
  }) async {
    try {
      await _storage.write(key: key, value: value);
      return ServiceResult(
        content: true,
        statusCode: 200,
        statusMessage: "Success",
      );
    } catch (e) {
      return ServiceResult(
        content: false,
        statusCode: 500,
        statusMessage: "Error saving data: $e",
      );
    }
  }

  // Retrieve a value
  @override
  Future<ServiceResult<String?>> retrieveData({required String key}) async {
    try {
      var response = await _storage.read(key: key);
      if (response != null) {
        return ServiceResult(
          content: response,
          statusCode: 200,
          statusMessage: "Retrieved Successfully",
        );
      } else {
        return ServiceResult(
          content: null,
          statusCode: 404,
          statusMessage: "Data not found",
        );
      }
    } catch (e) {
      return ServiceResult(
        content: null,
        statusCode: 500,
        statusMessage: "Error occurred: $e",
      );
    }
  }
}

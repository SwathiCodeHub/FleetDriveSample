import 'package:dio/dio.dart';
import 'package:fleetdrive/BOs/ResponseBOs/LoginResponse.dart';
import 'package:fleetdrive/BOs/RequestBOs/UserInfo.dart';
import 'package:fleetdrive/Helpers/APIHandler.dart';
import 'package:fleetdrive/Helpers/ServiceHelper.dart';
import 'package:fleetdrive/Services/FleepAPIServices/LoginAPI/ILoginAPI.dart';
import 'package:fleetdrive/Services/PlatformServices/PlatformNetworkCheckServices/IPlatformNetworkCheckService.dart';
import 'package:fleetdrive/Services/PlatformServices/PlatformSecureStorageService/IPlatformSecureStorageService.dart';
import 'package:get_it/get_it.dart';

class LoginAPI implements ILoginAPI {
  final IPlatformNetworkCheckServices platformNetworkCheckServices =
      GetIt.instance<IPlatformNetworkCheckServices>();
  final IPlatformSecureStorageService platformSecureStorageService =
      GetIt.instance<IPlatformSecureStorageService>();

  @override
  Future<ServiceResult<LoginResponse>> loginUser({
    required UserInfo userInfo,
  }) async {
    try {
      ServiceResult<bool> networkResponse =
          await platformNetworkCheckServices.checkNetworkConnectivity();
      if (networkResponse.content == true) {
        Dio dioInstance = DioInstanceCreation.loginDioInstance();
        Map<String, String> encodedJson = userInfo.toJson();
        Response loginResponse =
            await dioInstance.post("login", data: encodedJson);

        LoginResponse decodedloginResponse =
            LoginResponse.fromJson(loginResponse.data);
        // Check for the response status code
        switch (loginResponse.statusCode) {
          case 200:
            await platformSecureStorageService.saveData(
                key: "accessToken", value: decodedloginResponse.accessToken!);

            await platformSecureStorageService.saveData(
                key: "refreshToken", value: decodedloginResponse.refreshToken!);

            await platformSecureStorageService.saveData(
                key: "tenant", value: decodedloginResponse.defaultTenant!);
            return ServiceResult(
              content: LoginResponse.fromJson(loginResponse.data),
              statusCode: loginResponse.data['statusCode'],
              statusMessage: loginResponse.data['status'],
            );
          case 404:
            return ServiceResult(
              content: null,
              statusCode: 404,
              statusMessage: loginResponse.data['status'] ?? "Not Found",
            );
          default:
            return ServiceResult(
              content: null,
              statusCode: loginResponse.statusCode ?? 400,
              statusMessage: loginResponse.data['status'] ?? "Unexpected Error",
            );
        }
      } else {
        return ServiceResult(
            content: null,
            statusCode: 503,
            statusMessage: "Service Unavailable");
      }
    } catch (e) {
      // Optionally log the error
      print('Error during login: $e');
      return ServiceResult(
          content: null, statusCode: 500, statusMessage: "System Exception");
    }
  }
}

import 'package:dio/dio.dart';
import 'package:fleetdrive/Helpers/APIHandler.dart';
import 'package:fleetdrive/Services/PlatformServices/PlatformSecureStorageService/IPlatformSecureStorageService.dart';
import 'package:get_it/get_it.dart';

class DioInstanceCreation {
  static Dio loginDioInstance() {
    Dio dio = Dio(BaseOptions(
        baseUrl:
            'https://uat-fleetdrive.m2pfintech.com/lq-middleware/lqfleet/customer/',
        headers: {
          "platform": "android",
          "reqid": "5521059d12a4330d",
        }));
    return dio;
  }

  static Future<Dio> dioInstance() async {
    final IPlatformSecureStorageService platformSecureStorageService =
        GetIt.instance<IPlatformSecureStorageService>();
    ServiceResult<String?> retrieveAccessToken =
        await platformSecureStorageService.retrieveData(key: "accessToken");

    print("{retrivedAxccessToken: ${retrieveAccessToken.content}");

    ServiceResult<String?> retrieveRefreshToken =
        await platformSecureStorageService.retrieveData(key: "refreshToken");

    ServiceResult<String?> retrieveTenant =
        await platformSecureStorageService.retrieveData(key: "tenant");

    if (retrieveRefreshToken.content == retrieveAccessToken.content) {
      print("Same");
    }

    Dio dio = Dio(BaseOptions(
        baseUrl:
            'https://uat-fleetdrive.m2pfintech.com/lq-middleware/lqfleet/customer/',
        headers: {
          "platform": "android",
          "reqid": "5521059d12a4330d",
          "accesstoken": "Bearer ${retrieveAccessToken.content}",
          "refreshtoken": "Bearer ${retrieveRefreshToken.content}",
          "tenant": retrieveTenant.content
        }));
    return dio;
  }
}

  // static String? isTokenExpired(
  //     {required String accessToken, required String refreshToken}) {
  //   if (accessToken != null || accessToken.isNotEmpty) {
  //     bool accessTokenExpirationResult = JwtDecoder.isExpired(accessToken);
  //     if (accessTokenExpirationResult == false) {
  //       bool refreshTokenExpirationResult = JwtDecoder.isExpired(refreshToken);
  //       if (refreshTokenExpirationResult == false) {
  //         return null;
  //       } else {
  //         return refreshToken;
  //       }
  //     } else {
  //       return accessToken;
  //     }
  //   }
  //   return null;
  // }
  // static Future<Dio> dioInstance() async {
  //   try {
  //     final IPlatformSecureStorageService platformSecureStorageService =
  //         GetIt.instance<IPlatformSecureStorageService>();

  //     // Retrieve access token
  //     ServiceResult<String?> retrieveAccessToken =
  //         await platformSecureStorageService.retrieveData(key: "accessToken");
  //     print("{retrievedAccessToken: ${retrieveAccessToken.content}");

  //     // Retrieve refresh token
  //     ServiceResult<String?> retrieveRefreshToken =
  //         await platformSecureStorageService.retrieveData(key: "refreshToken");
  //     print("{retrievedRefreshToken: ${retrieveRefreshToken.content}");

  //     // Retrieve tenant
  //     ServiceResult<String?> retrieveTenant =
  //         await platformSecureStorageService.retrieveData(key: "tenant");
  //     print("{retrievedTenant: ${retrieveTenant.content}");

  //     if (retrieveAccessToken.content != null &&
  //         retrieveRefreshToken.content != null) {
  //       // Check if tokens are expired
  //       String? tokenDecider = isTokenExpired(
  //         accessToken: retrieveAccessToken.content!,
  //         refreshToken: retrieveRefreshToken.content!,
  //       );

  //       // If tokenDecider is null, both tokens are valid
  //       if (tokenDecider == null) {
  //         return _createDioInstance(retrieveAccessToken.content!,
  //             retrieveRefreshToken.content!, retrieveTenant.content!);
  //       } else {
  //         // Token decider contains the valid token; check which one it is
  //         if (tokenDecider == retrieveAccessToken.content) {
  //           // Return Dio instance with accessToken
  //           return _createDioInstance(retrieveAccessToken.content!,
  //               retrieveRefreshToken.content!, retrieveTenant.content!);
  //         } else if (tokenDecider == retrieveRefreshToken.content) {
  //           // Here, you should refresh the access token using the refresh token
  //           // Implement the logic for refreshing access token if required.
  //           // For now, we'll just use the refresh token directly.
  //           return _createDioInstance(retrieveAccessToken.content!,
  //               retrieveRefreshToken.content!, retrieveTenant.content!);
  //         } else {
  //           // If both tokens are expired, throw an error
  //           throw Exception("Both access token and refresh token are expired.");
  //         }
  //       }
  //     } else {
  //       // If tokens are missing, throw an error
  //       throw Exception("Access token or refresh token is missing.");
  //     }
  //   } catch (e) {
  //     print("Error in dioInstance: $e");
  //     rethrow;
  //   }
  // }

  // static Dio _createDioInstance(
  //     String accessToken, String refreshToken, String tenant) {
  //   Dio dio = Dio(BaseOptions(
  //     baseUrl:
  //         'https://uat-fleetdrive.m2pfintech.com/lq-middleware/lqfleet/customer/',
  //     headers: {
  //       "platform": "android",
  //       "reqid": "5521059d12a4330d",
  //       "accesstoken": "Bearer $accessToken", // Use accessToken
  //       "refreshtoken":
  //           "Bearer $refreshToken", // Include refreshToken in header as well
  //       "tenant": tenant
  //     },
  //   ));
  //   return dio;
  // }

  // static String? isTokenExpired(
  //     {required String accessToken, required String refreshToken}) {
  //   print(accessToken);
  //   bool accessTokenExpirationResult = JwtDecoder.isExpired(accessToken);
  //   if (!accessTokenExpirationResult) {
  //     // Access token is not expired
  //     return null;
  //   } else {
  //     // Access token is expired, check refresh token
  //     bool refreshTokenExpirationResult = JwtDecoder.isExpired(refreshToken);
  //     if (!refreshTokenExpirationResult) {
  //       // Refresh token is not expired, can be used to refresh access token
  //       return refreshToken;
  //     } else {
  //       // Both tokens are expired
  //       return accessToken; // Indicate both tokens are expired
  //     }
  //   }
  // }
// }

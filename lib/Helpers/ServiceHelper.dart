import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fleetdrive/Services/PlatformServices/PlatformSecureStorageService/IPlatformSecureStorageService.dart';
import 'package:get_it/get_it.dart';

class DioInstanceCreation {
  static Dio loginDioInstance() {
    return Dio(BaseOptions(
      baseUrl:
          'https://uat-fleetdrive.m2pfintech.com/lq-middleware/lqfleet/customer/',
      headers: {
        "platform": "android",
        "reqid": "5521059d12a4330d",
      },
    ));
  }

  // Method to create a Dio instance with SSL pinning
  static Future<Dio> createDioInstance() async {
    // Load the SSL certificate from assets
    final ByteData data = await rootBundle.load('assets/sslp_certificate.crt');
    final List<int> bytes = data.buffer.asUint8List();

    // Create a SecurityContext and set the loaded certificate
    final SecurityContext securityContext = SecurityContext();
    securityContext.setTrustedCertificatesBytes(bytes);

    // Create a Dio instance with SSL pinning
    Dio dio = Dio(BaseOptions(
      baseUrl: 'https://uat-fleetdrive.m2pfintech.com/lq-middleware/lqfleet/',
      headers: {
        "platform": "android",
        "reqid": "5521059d12a4330d",
      },
    ));

    // Override the Dio HttpClientAdapter to use the custom HttpClient
    // ignore: deprecated_member_use
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        // Verify the server certificate against your pinned certificate
        return cert.pem == String.fromCharCodes(bytes);
      };
    };

    return dio;
  }

  // Method to create a Dio instance with authentication headers
  static Future<Dio> dioInstance() async {
    final IPlatformSecureStorageService platformSecureStorageService =
        GetIt.instance<IPlatformSecureStorageService>();

    // Retrieve tokens and tenant information
    final accessTokenResult =
        await platformSecureStorageService.retrieveData(key: "accessToken");
    final refreshTokenResult =
        await platformSecureStorageService.retrieveData(key: "refreshToken");
    final tenantResult =
        await platformSecureStorageService.retrieveData(key: "tenant");

    // Log token retrieval results
    debugPrint("Retrieved Access Token: ${accessTokenResult.content}");
    debugPrint("Retrieved Refresh Token: ${refreshTokenResult.content}");

    if (accessTokenResult.content == null ||
        refreshTokenResult.content == null ||
        tenantResult.content == null) {
      throw Exception("Failed to retrieve necessary authentication data.");
    }

    // Create a Dio instance with SSL pinning
    Dio dio = await createDioInstance();

    // Set authentication headers
    dio.options.headers.addAll({
      "accesstoken": "Bearer ${accessTokenResult.content}",
      "refreshtoken": "Bearer ${refreshTokenResult.content}",
      "tenant": tenantResult.content,
    });

    return dio;
  }
}

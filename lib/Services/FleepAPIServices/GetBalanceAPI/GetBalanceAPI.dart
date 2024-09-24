import 'package:dio/dio.dart';
import 'package:fleetdrive/BOs/UserBalanceResponse.dart';
import 'package:fleetdrive/BOs/UserEntity.dart';
import 'package:fleetdrive/Helpers/APIHandler.dart';
import 'package:fleetdrive/Helpers/ServiceHelper.dart';
import 'package:fleetdrive/Services/FleepAPIServices/GetBalanceAPI/IGetBalanceAPI.dart';
import 'package:fleetdrive/Services/PlatformServices/PlatformNetworkCheckServices/IPlatformNetworkCheckService.dart';
import 'package:get_it/get_it.dart';

class GetBalanceAPI implements IGetBalanceAPI {
  @override
  Future<ServiceResult<int>> retriveBalance(
      {required UserEntity userEntity}) async {
    try {
      final IPlatformNetworkCheckServices platformNetworkCheckServices =
          GetIt.instance<IPlatformNetworkCheckServices>();
      ServiceResult<bool> networkResponse =
          await platformNetworkCheckServices.checkNetworkConnectivity();
      if (networkResponse.content == true) {
        Dio dioInstance = await DioInstanceCreation.dioInstance();

        Map<String, String> encodedJson = userEntity.toJson();
        print(encodedJson.values);
        Response retrieveBalanceResponse =
            await dioInstance.post("getBalance", data: encodedJson);

        UserBalanceResponse userBalanceResponse =
            UserBalanceResponse.fromJson(retrieveBalanceResponse.data);

        print(userBalanceResponse.result![0].balance);

        if (retrieveBalanceResponse.statusCode == 200) {
          return ServiceResult(
              content: retrieveBalanceResponse.data,
              statusCode: retrieveBalanceResponse.statusCode!,
              statusMessage: retrieveBalanceResponse.statusMessage!);
        } else if (retrieveBalanceResponse.statusCode == 402) {
          return ServiceResult(
              content: retrieveBalanceResponse.data,
              statusCode: retrieveBalanceResponse.statusCode!,
              statusMessage: retrieveBalanceResponse.statusMessage!);
        } else {
          return ServiceResult(
              content: null,
              statusCode: 500,
              statusMessage: "System Exception");
        }
      } else {
        return ServiceResult(
            content: null, statusCode: 503, statusMessage: "Network Issue");
      }
    } catch (e) {
      return ServiceResult(
          content: null, statusCode: 500, statusMessage: "System Exception");
    }
  }
}

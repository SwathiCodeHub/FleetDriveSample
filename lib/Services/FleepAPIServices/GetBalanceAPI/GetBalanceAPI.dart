import 'package:dio/dio.dart';
import 'package:fleetdrive/BOs/ResponseBOs/UserBalanceResponse.dart';
import 'package:fleetdrive/BOs/RequestBOs/UserEntity.dart';
import 'package:fleetdrive/Helpers/APIHandler.dart';
import 'package:fleetdrive/Helpers/ServiceHelper.dart';
import 'package:fleetdrive/Services/FleepAPIServices/GetBalanceAPI/IGetBalanceAPI.dart';
import 'package:fleetdrive/Services/PlatformServices/PlatformNetworkCheckServices/IPlatformNetworkCheckService.dart';
import 'package:get_it/get_it.dart';

class GetBalanceAPI implements IGetBalanceAPI {
  @override
  Future<ServiceResult<List<Balance>>> retriveBalance(
      {required UserEntity userEntity}) async {
    try {
      final IPlatformNetworkCheckServices platformNetworkCheckServices =
          GetIt.instance<IPlatformNetworkCheckServices>();
      ServiceResult<bool> networkResponse =
          await platformNetworkCheckServices.checkNetworkConnectivity();
      if (networkResponse.content == true) {
        Dio dioInstance = await DioInstanceCreation.dioInstance();

        Map<String, String> encodedJson = userEntity.toJson();

        Response retrieveBalanceResponse =
            await dioInstance.post("customer/getBalance", data: encodedJson);

        if (retrieveBalanceResponse.statusCode == 200) {
          List<Balance> balances =
              (retrieveBalanceResponse.data['result'] as List)
                  .map((item) => Balance.fromJson(item))
                  .toList();
          return ServiceResult(
              content: balances,
              statusCode: retrieveBalanceResponse.statusCode!,
              statusMessage: retrieveBalanceResponse.statusMessage!);
        } else if (retrieveBalanceResponse.statusCode == 402) {
          return ServiceResult(
              content: null,
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

import 'package:fleetdrive/Helpers/APIHandler.dart';
import 'package:fleetdrive/Services/PlatformServices/PlatformNetworkCheckServices/IPlatformNetworkCheckService.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class PlatformNetworkCheckService implements IPlatformNetworkCheckServices {
  @override
  Future<ServiceResult<bool>> checkNetworkConnectivity() async {
    try {
      bool result = await InternetConnection().hasInternetAccess;
      if (result == true) {
        return ServiceResult(
            content: result,
            statusCode: 200,
            statusMessage: "Network Access Available");
      } else {
        return ServiceResult(
            content: result,
            statusCode: 503,
            statusMessage: "No Internet Connection");
      }
    } catch (e) {
      return ServiceResult(
          content: false, statusCode: 503, statusMessage: "System Exception");
    }
  }
}

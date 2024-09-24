import 'package:fleetdrive/Helpers/APIHandler.dart';

abstract class IPlatformNetworkCheckServices {
  Future<ServiceResult<bool>> checkNetworkConnectivity();
}

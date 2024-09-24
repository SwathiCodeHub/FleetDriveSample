import 'package:fleetdrive/Helpers/APIHandler.dart';

abstract class IDeviceRootCheckService {
  Future<ServiceResult<bool>>  isDeviceRooted();
}

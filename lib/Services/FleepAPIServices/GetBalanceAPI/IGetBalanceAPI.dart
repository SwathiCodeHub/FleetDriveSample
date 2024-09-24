import 'package:fleetdrive/BOs/UserEntity.dart';
import 'package:fleetdrive/Helpers/APIHandler.dart';

abstract class IGetBalanceAPI {
  Future<ServiceResult<int>> retriveBalance({required UserEntity userEntity});
}

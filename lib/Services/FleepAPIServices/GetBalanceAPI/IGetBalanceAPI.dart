import 'package:fleetdrive/BOs/ResponseBOs/UserBalanceResponse.dart';
import 'package:fleetdrive/BOs/RequestBOs/UserEntity.dart';
import 'package:fleetdrive/Helpers/APIHandler.dart';

abstract class IGetBalanceAPI {
  Future<ServiceResult<List<Balance>>>  retriveBalance(
      {required UserEntity userEntity});
}

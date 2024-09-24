import 'package:fleetdrive/BOs/GetCardsResponse.dart';
import 'package:fleetdrive/BOs/UserEntity.dart';
import 'package:fleetdrive/Helpers/APIHandler.dart';

abstract class ICardsAPI {
  Future<ServiceResult<GetCardsResponse>> retrieveCards({required UserEntity userEntity});
}

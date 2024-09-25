import 'package:fleetdrive/BOs/ResponseBOs/GetCardsResponse.dart';
import 'package:fleetdrive/BOs/RequestBOs/UserEntity.dart';
import 'package:fleetdrive/Helpers/APIHandler.dart';

abstract class ICardsAPI {
  Future<ServiceResult<GetCardsResponse>> retrieveCards({required UserEntity userEntity});
}

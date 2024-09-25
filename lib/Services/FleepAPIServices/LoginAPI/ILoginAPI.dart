import 'package:fleetdrive/BOs/ResponseBOs/LoginResponse.dart';
import 'package:fleetdrive/BOs/RequestBOs/UserInfo.dart';
import 'package:fleetdrive/Helpers/APIHandler.dart';

abstract class ILoginAPI {
  Future<ServiceResult<LoginResponse>> loginUser({required UserInfo userInfo});
}

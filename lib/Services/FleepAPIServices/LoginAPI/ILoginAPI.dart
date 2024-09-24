import 'package:fleetdrive/BOs/LoginResponse.dart';
import 'package:fleetdrive/BOs/UserInfo.dart';
import 'package:fleetdrive/Helpers/APIHandler.dart';

abstract class ILoginAPI {
  Future<ServiceResult<LoginResponse>> loginUser({required UserInfo userInfo});
}

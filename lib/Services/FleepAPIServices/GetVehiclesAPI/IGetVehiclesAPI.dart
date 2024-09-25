import 'package:fleetdrive/BOs/RequestBOs/GetVehiclesRequest.dart';
import 'package:fleetdrive/BOs/ResponseBOs/GetVehiclesResponse.dart';
import 'package:fleetdrive/Helpers/APIHandler.dart';

abstract class IVehiclesAPI {
  Future<ServiceResult<List<PersonDetails>>> retrieveVehicles(
      {required VehiclesRequest vehicleRequest});
}

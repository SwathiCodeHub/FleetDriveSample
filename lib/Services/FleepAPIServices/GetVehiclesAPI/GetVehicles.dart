import 'package:dio/dio.dart';
import 'package:fleetdrive/BOs/RequestBOs/GetVehiclesRequest.dart';
import 'package:fleetdrive/BOs/ResponseBOs/GetVehiclesResponse.dart';
import 'package:fleetdrive/Helpers/APIHandler.dart';
import 'package:fleetdrive/Helpers/ServiceHelper.dart';
import 'package:fleetdrive/Services/FleepAPIServices/GetVehiclesAPI/IGetVehiclesAPI.dart';
import 'package:fleetdrive/Services/PlatformServices/PlatformNetworkCheckServices/IPlatformNetworkCheckService.dart';
import 'package:get_it/get_it.dart';

class VehicleAPI implements IVehiclesAPI {
  Future<ServiceResult<List<PersonDetails>>> retrieveVehicles(
      {required VehiclesRequest vehicleRequest}) async {
    try {
      // Check network connectivity
      final IPlatformNetworkCheckServices platformNetworkCheckServices =
          GetIt.instance<IPlatformNetworkCheckServices>();
      ServiceResult<bool> networkResponse =
          await platformNetworkCheckServices.checkNetworkConnectivity();

      if (networkResponse.content == true) {
        // Create Dio instance for making API calls
        Dio dioInstance = await DioInstanceCreation.dioInstance();

        // Prepare request data
        Map<String, dynamic> encodedTransaction = vehicleRequest.toJson();

        // Make POST request to fetch vehicles
        Response vehiclesResponse = await dioInstance.post(
          "vehicle/fetchVehiclesByParent",
          data: encodedTransaction,
        );

        // If response is successful, proceed
        if (vehiclesResponse.statusCode == 200) {
          // Parse the response to extract the result['result']
          List<dynamic> vehiclesData =
              vehiclesResponse.data['result']['result'];

          // Map the data to List<PersonDetails>
          List<PersonDetails> personDetailsList = vehiclesData.map((data) {
            return PersonDetails.fromJson(data);
          }).toList();

          // Return the parsed list of PersonDetails
          return ServiceResult(
            content: personDetailsList,
            statusCode: vehiclesResponse.statusCode!,
            statusMessage: "success",
          );
        } else {
          // Handle failure cases
          return ServiceResult(
            content: null,
            statusCode: vehiclesResponse.statusCode!,
            statusMessage: "Failed to fetch vehicles",
          );
        }
      } else {
        // Handle network failure
        return ServiceResult(
          content: null,
          statusCode: 503,
          statusMessage: "Network Issue",
        );
      }
    } catch (e) {
      // Handle system exceptions
      return ServiceResult(
        content: null,
        statusCode: 500,
        statusMessage: "System Exception",
      );
    }
  }
}

import 'package:fleetdrive/Helpers/APIHandler.dart';
import 'package:fleetdrive/Services/DeviceServices/DeviceRootedCheckServoice/IDeviceRootedCheckService.dart';
import 'package:root_check/root_check.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceRootCheckService implements IDeviceRootCheckService {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  @override
  Future<ServiceResult<bool>> isDeviceRooted() async {
    try {
      // Check if the device is rooted using the root_check package
      bool isRooted = await RootCheck.isRooted ?? false;

      // Get device information for additional checks
      final deviceData = await _deviceInfo.deviceInfo;

      // Add additional checks based on the device data if needed
      if (deviceData is AndroidDeviceInfo) {
        // Example: Check if the device is an emulator
        isRooted = isRooted || !deviceData.isPhysicalDevice;
      }

      if (isRooted) {
        return ServiceResult(
          content: true,
          statusCode: 200,
          statusMessage: "Device is rooted",
        );
      } else {
        return ServiceResult(
          content: false,
          statusCode: 200,
          statusMessage: "Device is not rooted",
        );
      }
    } catch (e) {
      // Handle any errors during the root check
      return ServiceResult(
        content: false,
        statusCode: 500,
        statusMessage: "System Exception: Unable to check root status",
      );
    }
  }
}

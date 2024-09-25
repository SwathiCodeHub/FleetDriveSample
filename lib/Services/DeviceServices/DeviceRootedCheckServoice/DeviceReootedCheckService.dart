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

      // Additional checks for Android devices
      if (deviceData is AndroidDeviceInfo) {
        isRooted = isRooted ||
            !deviceData.isPhysicalDevice; // Check if the device is an emulator
      }

      return _buildServiceResult(isRooted);
    } catch (e) {
      return _buildErrorResult();
    }
  }

  ServiceResult<bool> _buildServiceResult(bool isRooted) {
    return ServiceResult(
      content: isRooted,
      statusCode: 200,
      statusMessage: isRooted ? "Device is rooted" : "Device is not rooted",
    );
  }

  ServiceResult<bool> _buildErrorResult() {
    return ServiceResult(
      content: false,
      statusCode: 500,
      statusMessage: "System Exception: Unable to check root status",
    );
  }
}

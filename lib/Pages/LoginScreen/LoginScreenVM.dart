import 'package:fleetdrive/BOs/ResponseBOs/LoginResponse.dart';
import 'package:fleetdrive/BOs/RequestBOs/UserInfo.dart';
import 'package:fleetdrive/Helpers/APIHandler.dart';
import 'package:fleetdrive/Pages/HomeScreen/HomeScreeView.dart';
import 'package:fleetdrive/Pages/LoginScreen/LoginStateNotifier.dart';
import 'package:fleetdrive/Services/FleepAPIServices/LoginAPI/ILoginAPI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class LoginscreenVM {
  Future<void> loginUser(
      BuildContext context, String pin, WidgetRef ref) async {
    ref.read(loginProvider.notifier).setLoading(true); // Set loading to true

    // Check if the pin is "1234"
    if (pin == "1234") {
      // Create an instance of your LoginAPI
      ILoginAPI loginAPIInstance = GetIt.instance<ILoginAPI>();

      // Create a UserInfo object (populate with relevant data)
      UserInfo userInfo = UserInfo(
          mobile: "9677367036",
          mpin: pin); // Replace with your actual constructor

      // Call the loginUser method
      ServiceResult<LoginResponse> result =
          await loginAPIInstance.loginUser(userInfo: userInfo);

      // Set loading to false after getting the response
      ref.read(loginProvider.notifier).setLoading(false);

      // Handle the response
      if (result.statusCode == 200) {
        // Navigate to the next page on successful login
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreenView()),
        );
      } else {
        // Show error message in the state
        ref.read(loginProvider.notifier).setErrorMessage(result.statusMessage);
        // Show a toast message for other status codes
        Fluttertoast.showToast(
          msg: result.statusMessage,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } else {
      // Set loading to false for incorrect pin
      ref.read(loginProvider.notifier).setLoading(false);

      // Show a toast message for incorrect pin
      Fluttertoast.showToast(
        msg: "Incorrect Pin",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}

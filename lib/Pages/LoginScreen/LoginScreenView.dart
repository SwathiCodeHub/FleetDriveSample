import 'package:fleetdrive/Pages/LoginScreen/DependentViews/BiometricView.dart';
import 'package:fleetdrive/Pages/LoginScreen/DependentViews/ErrorMessage.dart';
import 'package:fleetdrive/Pages/LoginScreen/DependentViews/ForgotPinView.dart';
import 'package:fleetdrive/Pages/LoginScreen/DependentViews/GreetingsText.dart';
import 'package:fleetdrive/Pages/LoginScreen/DependentViews/InstructionText.dart';
import 'package:fleetdrive/Pages/LoginScreen/DependentViews/LoadingIndicatorView.dart';
import 'package:fleetdrive/Pages/LoginScreen/DependentViews/MpinInstruction.dart';
import 'package:fleetdrive/Pages/LoginScreen/DependentViews/PincodeFields.dart';
import 'package:fleetdrive/Pages/LoginScreen/LoginScreenVM.dart';
import 'package:fleetdrive/Pages/LoginScreen/LoginStateNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreenView extends ConsumerWidget {
  LoginScreenView({super.key});

  final LoginscreenVM _loginscreenVM = LoginscreenVM();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 45.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GreetingText(),
            InstructionsText(),
            Mpininstruction(),
            PinCodeField(
                ref: ref, context: context, loginscreenVM: _loginscreenVM),
            LoadingIndicator(isLoading: loginState.isLoading),
            ErrorMessage(errorMessage: loginState.errorMessage),
            ForgotMpinButton(),
            Spacer(),
            BiometricButton(),
          ],
        ),
      ),
    );
  }
}

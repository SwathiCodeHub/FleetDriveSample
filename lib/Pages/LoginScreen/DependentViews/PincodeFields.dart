import 'package:fleetdrive/Pages/LoginScreen/LoginScreenVM.dart';
import 'package:fleetdrive/Pages/LoginScreen/LoginStateNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PinCodeField extends StatelessWidget {
  final WidgetRef ref;
  final BuildContext context;
  final LoginscreenVM loginscreenVM;

  PinCodeField({required this.ref, required this.context, required this.loginscreenVM});

  @override
  Widget build(BuildContext context) {
    return PinCodeFields(
      borderColor: Colors.grey,
      onComplete: (String value) async {
        ref.read(loginProvider.notifier).setPinCode(value);
        await loginscreenVM.loginUser(context, value, ref);
      },
    );
  }
}
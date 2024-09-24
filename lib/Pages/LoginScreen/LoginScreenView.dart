// import 'package:fleetdrive/Pages/LoginScreen/LoginScreenVM.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LoginScreenView extends StatefulWidget {
//   const LoginScreenView({super.key});

//   @override
//   State<LoginScreenView> createState() => _LoginScreenViewState();
// }

// class _LoginScreenViewState extends State<LoginScreenView> {
//   LoginscreenVM _loginscreenVM = LoginscreenVM();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 45.h),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Hi, MohanRaj",
//                 style:
//                     GoogleFonts.poppins(fontSize: 20.sp, color: Colors.black)),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 20.h),
//               child: Text("Welcome back!",
//                   style: GoogleFonts.poppins(
//                       fontSize: 12.5.sp, color: Colors.grey)),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 10.h),
//               child: Text("Enter your 4-digit MPIN",
//                   style:
//                       GoogleFonts.poppins(fontSize: 12.sp, color: Colors.grey)),
//             ),
//             PinCodeFields(
//               borderColor: Colors.grey,
//               onComplete: (String value) {
//                 _loginscreenVM.loginUser(context, value);
//               },
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: TextButton(
//                 onPressed: () {},
//                 style: TextButton.styleFrom(
//                   overlayColor: Colors.transparent,
//                   shape:
//                       RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//                   padding: EdgeInsets.zero,
//                 ),
//                 child: Text(
//                   "Forgot MPIN?",
//                   style: GoogleFonts.poppins(
//                     fontSize:
//                         12.sp, // Ensure this value is defined in your imports
//                     color: Colors.blue,
//                   ),
//                 ),
//               ),
//             ),
//             Spacer(),
//             Align(
//               alignment: Alignment.center,
//               child: TextButton(
//                 onPressed: () {},
//                 style: TextButton.styleFrom(
//                   overlayColor: Colors.transparent,
//                   shape:
//                       RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//                   padding: EdgeInsets.zero,
//                 ),
//                 child: Text(
//                   "Use Biometric",
//                   style: GoogleFonts.poppins(
//                     fontSize:
//                         12.sp, // Ensure this value is defined in your imports
//                     color: Colors.blue,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
            Text(
              "Hi, MohanRaj",
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Text(
                "Welcome back!",
                style: GoogleFonts.poppins(
                  fontSize: 12.5.sp,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(
                "Enter your 4-digit MPIN",
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
              ),
            ),
            PinCodeFields(
              borderColor: Colors.grey,
              onComplete: (String value) async {
                ref.read(loginProvider.notifier).setPinCode(value);
                await _loginscreenVM.loginUser(context, value, ref);
              },
            ),
            if (loginState.isLoading)
              Center(
                  child: CircularProgressIndicator()), // Show loading indicator
            if (loginState.errorMessage != null)
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Text(
                  loginState.errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  overlayColor: Colors.transparent,
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  "Forgot MPIN?",
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  overlayColor: Colors.transparent,
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  "Use Biometric",
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

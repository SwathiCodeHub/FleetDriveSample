import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiometricButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          // Handle biometric login action
        },
        style: TextButton.styleFrom(
          overlayColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
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
    );
  }
}

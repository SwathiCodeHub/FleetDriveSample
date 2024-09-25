import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotMpinButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Handle forgot MPIN action
        },
        style: TextButton.styleFrom(
          overlayColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
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
    );
  }
}

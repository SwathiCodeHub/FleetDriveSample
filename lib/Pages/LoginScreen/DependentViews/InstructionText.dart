import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InstructionsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Text(
        "Welcome back!",
        style: GoogleFonts.poppins(
          fontSize: 12.5.sp,
          color: Colors.grey,
        ),
      ),
    );
  }
}
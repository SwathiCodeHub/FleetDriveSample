import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Mpininstruction extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Text(
        "Enter your 4-digit MPIN",
        style: GoogleFonts.poppins(
          fontSize: 12.sp,
          color: Colors.grey,
        ),
      ),
    );
  }
}

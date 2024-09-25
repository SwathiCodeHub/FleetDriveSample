import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GreetingText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Hi, MohanRaj",
      style: GoogleFonts.poppins(
        fontSize: 20.sp,
        color: Colors.black,
      ),
    );
  }
}
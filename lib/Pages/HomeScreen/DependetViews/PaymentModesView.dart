import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentModesView extends StatelessWidget {
  final String label;
  final IconData icon;
  final double avatarRadius;

  PaymentModesView({
    Key? key,
    required this.icon,
    required this.label,
    this.avatarRadius = 20.0, // Default value for avatar radius
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: avatarRadius.w,
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, color: Colors.purple, size: 20.w),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(fontSize: 10.sp, color: Colors.black),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleView extends StatelessWidget {
  final String title;
  final String actionText;

  TitleView({
    Key? key,
    required this.actionText,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              actionText,
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

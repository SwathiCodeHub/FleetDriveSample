import 'package:fleetdrive/BOs/ResponseBOs/UserBalanceResponse.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailableCards extends StatelessWidget {
  final Balance balance;

  const AvailableCards({required this.balance, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Color(0xFF682A86), // Example card color
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Available Balance",
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "₹ ${balance.balance}",
            style: GoogleFonts.poppins(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            "xxxx xxxx 0089",
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink, // Button color
                ),
                child: Text(
                  "Add Money",
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.white),
                ),
                child: Text(
                  "Manage Card",
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentTransactionView extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final bool isDebit;

  RecentTransactionView({
    Key? key,
    required this.title,
    required this.date,
    required this.amount,
    required this.isDebit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 30.h,
                    width: 30.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.black26),
                    ),
                    // Add an icon or image here if needed
                    child: Icon(
                      Icons.attach_money, // Example icon
                      color: Colors.green,
                      size: 16.w,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: title,
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                '\n', // Adds a new line between the title and date
                            style: TextStyle(
                                color: Colors.transparent), // Optional
                          ),
                          TextSpan(
                            text: date,
                            style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            (isDebit ? '- ' : '+ ') +
                '₹ $amount', // Conditional symbol for debit/credit
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: isDebit ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

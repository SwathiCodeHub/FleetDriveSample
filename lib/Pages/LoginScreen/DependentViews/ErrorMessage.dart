import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorMessage extends StatelessWidget {
  final String? errorMessage;

  ErrorMessage({this.errorMessage});

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null) {
      return Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Text(
          errorMessage!,
          style: TextStyle(color: Colors.red),
        ),
      );
    }
    return SizedBox.shrink();
  }
}

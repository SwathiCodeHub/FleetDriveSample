import 'package:fleetdrive/BOs/ResponseBOs/GetTransactionResponse.dart';
import 'package:fleetdrive/BOs/ResponseBOs/GetVehiclesResponse.dart';
import 'package:fleetdrive/Helpers/LogicHelper.dart';
import 'package:fleetdrive/Pages/HomeScreen/DependetViews/RecentTransactionView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleDetailsScreen extends StatelessWidget {
  final List<Transaction> transactions;
  final PersonDetails vehicles;

  VehicleDetailsScreen({
    Key? key,
    required this.transactions,
    required this.vehicles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('View Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Row(
                children: [
                  Text(
                    vehicles.serialNo?.toString() ?? 'N/A',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Switch(
                    value: vehicles.kitStatus?.isEquivalentKitStatus() ?? false,
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.grey.withOpacity(0.5),
                    onChanged: (value) {
                      // Handle switch change
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow('Name of the Owner',
                          vehicles.firstName?.toString() ?? 'N/A'),
                      _buildDetailRow(
                          'FasTag Serial Number', vehicles.serialNo.toString()),
                      _buildDetailRow(
                          'FasTag Registered Date',
                          vehicles.specialDate?.formatDate() ??
                              "08 March 2026"),
                      _buildDetailRow(
                          'Vehicle class', vehicles.profileId.toString()),
                      _buildDetailRow(
                          'RC Reg. No.', vehicles.entityId.toString()),
                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Handle download action
                            },
                            child: Text(
                              'Download Tag fitment certificate',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 10.sp,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle replace action
                            },
                            child: Text(
                              'Replace FasTag',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 10.sp,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              // Restricting ListView with height to avoid layout issues
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return RecentTransactionView(
                      title: transaction.billRefNo?.toString() ?? 'N/A',
                      amount: transaction.amount?.toString() ?? 'N/A',
                      date: transaction.created?.toString() ?? 'N/A',
                      isDebit: transaction.type == 'DEBIT',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(
      String title, String amount, String date, bool isDebit) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Icon(
            isDebit ? Icons.remove : Icons.add,
            color: isDebit ? Colors.red : Colors.green,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  date,
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16.sp,
              color: isDebit ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

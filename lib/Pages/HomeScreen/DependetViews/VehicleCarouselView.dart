import 'package:fleetdrive/BOs/ResponseBOs/GetTransactionResponse.dart';
import 'package:fleetdrive/BOs/ResponseBOs/GetVehiclesResponse.dart';
import 'package:fleetdrive/Helpers/LogicHelper.dart';
import 'package:fleetdrive/Pages/VehicleDetails/VehicleDetailsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleCarousel extends StatelessWidget {
  final List<PersonDetails> vehicles;
  final List<Transaction> transactions;

  const VehicleCarousel({
    Key? key,
    required this.vehicles,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h, // Set the height of the carousel
      child: vehicles.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: vehicles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VehicleDetailsScreen(
                          transactions: transactions,
                          vehicles: vehicles[index],
                        ),
                      ),
                    );
                  },
                  child: VehicleCard(
                    name: vehicles[index].entityType!,
                    number: vehicles[index].country!,
                    isActive:
                        vehicles[index].kitStatus?.isEquivalentKitStatus() ??
                            false,
                  ),
                );
              },
            )
          : Center(
              child: Text(
                "No Vehicles Available",
                style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.grey),
              ),
            ),
    );
  }
}

class VehicleCard extends StatelessWidget {
  final String name;
  final String number;
  final bool isActive;

  const VehicleCard({
    Key? key,
    required this.name,
    required this.number,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      width: 160.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 2.w,
                backgroundColor: isActive ? Colors.green : Colors.grey,
              ),
              SizedBox(width: 4.w),
              Text(
                isActive ? "ACTIVE" : "INACTIVE",
                style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                  color: isActive ? Colors.green : Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            name.toLowerCase(),
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            number,
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

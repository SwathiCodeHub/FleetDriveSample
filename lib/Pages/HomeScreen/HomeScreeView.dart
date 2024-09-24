import 'package:fleetdrive/BOs/UserEntity.dart';
import 'package:fleetdrive/Pages/HomeScreen/DependetViews/AvailableBalanceCards.dart';
import 'package:fleetdrive/Services/FleepAPIServices/CardListAPI/ICardListAPI.dart';
import 'package:fleetdrive/Services/FleepAPIServices/GetBalanceAPI/IGetBalanceAPI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

// class HomeScreenView extends StatefulWidget {
//   const HomeScreenView({super.key});

//   @override
//   State<HomeScreenView> createState() => _HomeScreenViewState();
// }

// class _HomeScreenViewState extends State<HomeScreenView> {
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       IGetBalanceAPI getBalanceAPI = GetIt.instance<IGetBalanceAPI>();
//       getBalanceAPI.retriveBalance(
//           userEntity: UserEntity(entityId: "9677367036"));
//       ICardsAPI getCards = GetIt.instance<ICardsAPI>();
//       getCards.retrieveCards(userEntity: UserEntity(entityId: "9677367036"));
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [Text("data")],
//       ),
//     );
//   }
// }

class HomeScreenView extends StatefulWidget {
  @override
  State<HomeScreenView> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      IGetBalanceAPI getBalanceAPI = GetIt.instance<IGetBalanceAPI>();
      getBalanceAPI.retriveBalance(
          userEntity: UserEntity(entityId: "9677367036"));
      ICardsAPI getCards = GetIt.instance<ICardsAPI>();
      getCards.retrieveCards(userEntity: UserEntity(entityId: "9677367036"));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0, // Hide AppBar for the custom layout
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting Section
              Text(
                "Hi, Mohanraj",
                style: GoogleFonts.poppins(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "Good to see you!",
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20.h),

              // Balance Card Section
              AvailableCards(),
              SizedBox(height: 20.h),

              // Money Transfer via UPI Section
              Text(
                "Money Transfer via UPI",
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _iconButton("Pay UPI ID", Icons.qr_code),
                  _iconButton("Bank Transfer", Icons.account_balance),
                  _iconButton("Request Money", Icons.request_page),
                  _iconButton("Transaction History", Icons.history),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                "My UPI ID: 8946098205.qwallet@liv",
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 20.h),

              // Vehicle Details Section
              _sectionTitle("Vehicle Details", "View all"),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _vehicleCard("Maruti Suzuki", "TN10 CA5764", true),
                  _vehicleCard("Honda Civic", "TN10 CA1234", true),
                ],
              ),
              SizedBox(height: 20.h),

              // Recent Transactions Section
              _sectionTitle("Recent Transactions", "View all"),
              SizedBox(height: 8.h),
              _transactionItem(
                title: "Chennai toll -NH 07",
                date: "Sep 01-2022 - 12:00 AM",
                amount: "- ₹ 300",
                isDebit: true,
              ),
              _transactionItem(
                title: "Recharge",
                date: "Aug 31-2022 - 05:30 PM",
                amount: "+ ₹ 1000",
                isDebit: false,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_car), label: "Vehicles"),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 20.w,
                backgroundColor: Colors.purple,
                child: Icon(Icons.qr_code_scanner, color: Colors.white),
              ),
              label: "Scan QR"),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long), label: "Transaction"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _iconButton(String label, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20.w,
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

  Widget _vehicleCard(String name, String number, bool isActive) {
    return Container(
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
                radius: 6.w,
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
            name,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
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

  Widget _transactionItem(
      {required String title,
      required String date,
      required String amount,
      required bool isDebit}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                date,
                style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Text(
            amount,
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

  Widget _sectionTitle(String title, String actionText) {
    return Row(
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
        Text(
          actionText,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

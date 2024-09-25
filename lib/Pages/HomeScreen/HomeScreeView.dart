import 'package:carousel_slider/carousel_slider.dart';
import 'package:fleetdrive/BOs/RequestBOs/GetVehiclesRequest.dart';
import 'package:fleetdrive/BOs/RequestBOs/TransactionRequest.dart';
import 'package:fleetdrive/Helpers/LogicHelper.dart';
import 'package:fleetdrive/Pages/HomeScreen/DependetViews/AvailableBalanceCards.dart';
import 'package:fleetdrive/Pages/HomeScreen/DependetViews/BuildGreetings.dart';
import 'package:fleetdrive/Pages/HomeScreen/DependetViews/PaymentModesView.dart';
import 'package:fleetdrive/Pages/HomeScreen/DependetViews/RecentTransactionView.dart';
import 'package:fleetdrive/Pages/HomeScreen/DependetViews/TitleView.dart';
import 'package:fleetdrive/Pages/HomeScreen/DependetViews/VehicleCarouselView.dart';
import 'package:fleetdrive/Pages/HomeScreen/HomeStateNotifierProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenView extends ConsumerStatefulWidget {
  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends ConsumerState<HomeScreenView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(balanceProvider.notifier).fetchBalance('9677367036');

      ref.read(vehicleProvider.notifier).fetchVehicles(VehiclesRequest(
          entityType: "16",
          pageNumber: 0,
          pageSize: "5",
          parentEntityId: "9677367036")); // Fetch vehicles here

      ref.read(transactionProvider.notifier).fetchTransactions(
          TransactionRequest(
              corporate: "LQFLEET",
              pageNumber: 0,
              pageSize: "5",
              parentEntityId: "9677367036"));
    });
  }

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final balanceState = ref.watch(balanceProvider);
    final vehicleState = ref.watch(vehicleProvider);
    final transactionState = ref.watch(transactionProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
              BuildGreeting(name: "MohanRaj"),

              // Balance Section with Error Handling
              balanceState.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : balanceState.error != null
                      ? Center(child: Text("Error: ${balanceState.error}"))
                      : CarouselSlider(
                          items: balanceState.data?.map((balance) {
                            return Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: AvailableCards(balance: balance),
                            );
                          }).toList(),
                          options: CarouselOptions(
                            height: 150.h,
                            viewportFraction: 1,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                          ),
                        ),

              SizedBox(height: 20.h),

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
              Container(
                height: 110.h,
                width: 350.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        height: 68.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (var item in [
                              {"label": "Pay UPI ID", "icon": Icons.qr_code},
                              {
                                "label": "Bank Transfer",
                                "icon": Icons.account_balance
                              },
                              {
                                "label": "Request Money",
                                "icon": Icons.request_page
                              },
                              {
                                "label": "Transaction History",
                                "icon": Icons.history
                              },
                            ])
                              Expanded(
                                child: PaymentModesView(
                                    label: item["label"].toString(),
                                    icon: item["icon"] as IconData),
                              ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 2.h,
                        color: Colors.grey.shade100,
                        thickness: 1.1,
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        "My UPI ID: 8946098205.qwallet@liv",
                        style: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 2.h),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // Vehicle Details Section
              TitleView(actionText: "View all", title: "Vehicle Details"),
              SizedBox(height: 8.h),

              vehicleState.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : VehicleCarousel(
                      vehicles: vehicleState.data ?? [],
                      transactions: transactionState.data ?? []),
              SizedBox(height: 20.h),

              // Recent Transactions Section
              TitleView(title: "Recent Transactions", actionText: "View all"),
              SizedBox(height: 8.h),
              transactionState.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : transactionState.data != null
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: transactionState.data!.length,
                          itemBuilder: (context, index) {
                            final transaction = transactionState.data![index];
                            return RecentTransactionView(
                              title: transaction.otherPartyName!,
                              date: transaction.created?.formatDate() ??
                                  0.formatDate(),
                              amount: transaction.amount.toString(),
                              isDebit:
                                  transaction.type == 'DEBIT' ? true : false,
                            );
                          },
                        )
                      : Center(
                          child: Text(transactionState.error ??
                              "No transactions Found"))
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
}

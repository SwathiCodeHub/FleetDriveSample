import 'package:fleetdrive/Pages/LoginScreen/LoginScreenView.dart';
import 'package:fleetdrive/Pages/RootedWarningScreen/RootedWarningScreenView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  final bool isRooted;

  const MyApp({Key? key, required this.isRooted}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: isRooted != true ? LoginScreenView() : RootWarningScreen(),
            // routes: {
            //   '/': (context) =>
            //       isRooted != true ? LoginScreenView() : RootWarningScreen(),
            //   '/vehicles': (context) => VehicleDetailsScreen(),
            //   '/home': (context) => HomeScreenView()
            // },
          );
        },
      ),
    );
  }
}

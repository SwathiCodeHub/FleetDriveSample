import 'package:fleetdrive/BOs/LoginResponse.dart';
import 'package:fleetdrive/BOs/UserEntity.dart';
import 'package:fleetdrive/BOs/UserInfo.dart';
import 'package:fleetdrive/Helpers/APIHandler.dart';
import 'package:fleetdrive/Pages/HomeScreen/HomeScreeView.dart';
import 'package:fleetdrive/Pages/LoginScreen/LoginScreenView.dart';
import 'package:fleetdrive/Pages/RootedWarningScreen/RootedWarningScreenView.dart';
import 'package:fleetdrive/Pages/VehicleDetails/VehicleDetailsView.dart';
import 'package:fleetdrive/Services/DeviceServices/DeviceRootedCheckServoice/DeviceReootedCheckService.dart';
import 'package:fleetdrive/Services/DeviceServices/DeviceRootedCheckServoice/IDeviceRootedCheckService.dart';
import 'package:fleetdrive/Services/FleepAPIServices/CardListAPI/CardListAPI.dart';
import 'package:fleetdrive/Services/FleepAPIServices/CardListAPI/ICardListAPI.dart';
import 'package:fleetdrive/Services/FleepAPIServices/GetBalanceAPI/GetBalanceAPI.dart';
import 'package:fleetdrive/Services/FleepAPIServices/GetBalanceAPI/IGetBalanceAPI.dart';
import 'package:fleetdrive/Services/FleepAPIServices/LoginAPI/LoginAPI.dart';
import 'package:fleetdrive/Services/FleepAPIServices/LoginAPI/ILoginAPI.dart';
import 'package:fleetdrive/Services/PlatformServices/PlatformNetworkCheckServices/IPlatformNetworkCheckService.dart';
import 'package:fleetdrive/Services/PlatformServices/PlatformNetworkCheckServices/PlatformNetworkCheckService.dart';
import 'package:fleetdrive/Services/PlatformServices/PlatformSecureStorageService/IPlatformSecureStorageService.dart';
import 'package:fleetdrive/Services/PlatformServices/PlatformSecureStorageService/PlatformSecureStorageService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

late final bool isRooted;
Future<void> main() async {
  runApp(const MyApp());

  GetIt.instance.registerFactory<ILoginAPI>(() => LoginAPI());
  GetIt.instance.registerFactory<IPlatformSecureStorageService>(
      () => PlatformSecureStorageService());
  GetIt.instance.registerFactory<IPlatformNetworkCheckServices>(
      () => PlatformNetworkCheckService());
  GetIt.instance.registerFactory<IGetBalanceAPI>(() => GetBalanceAPI());
  GetIt.instance.registerFactory<ICardsAPI>(() => CardsAPI());

  GetIt.instance
      .registerFactory<IDeviceRootCheckService>(() => DeviceRootCheckService());
  final IDeviceRootCheckService deviceRootCheckService =
      GetIt.instance<IDeviceRootCheckService>();

  ServiceResult<bool> rootedCheckResponse =
      await deviceRootCheckService.isDeviceRooted();
  isRooted = rootedCheckResponse.content ?? false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routes: {
              '/': (context) =>
                  isRooted != true ? LoginScreenView() : RootWarningScreen(),
              '/vehicles': (context) => const VehicleScreenView(),
              '/home': (context) => HomeScreenView()
            },
          );
        },
      ),
    );
  }
}

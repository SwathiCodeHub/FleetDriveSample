import 'dart:async';
import 'package:fleetdrive/Helpers/APIHandler.dart';
import 'package:fleetdrive/MyApp.dart';
import 'package:fleetdrive/Services/DeviceServices/DeviceRootedCheckServoice/DeviceReootedCheckService.dart';
import 'package:fleetdrive/Services/DeviceServices/DeviceRootedCheckServoice/IDeviceRootedCheckService.dart';
import 'package:fleetdrive/Services/FleepAPIServices/CardListAPI/CardListAPI.dart';
import 'package:fleetdrive/Services/FleepAPIServices/CardListAPI/ICardListAPI.dart';
import 'package:fleetdrive/Services/FleepAPIServices/GetBalanceAPI/GetBalanceAPI.dart';
import 'package:fleetdrive/Services/FleepAPIServices/GetBalanceAPI/IGetBalanceAPI.dart';
import 'package:fleetdrive/Services/FleepAPIServices/GetVehiclesAPI/GetVehicles.dart';
import 'package:fleetdrive/Services/FleepAPIServices/GetVehiclesAPI/IGetVehiclesAPI.dart';
import 'package:fleetdrive/Services/FleepAPIServices/LoginAPI/LoginAPI.dart';
import 'package:fleetdrive/Services/FleepAPIServices/LoginAPI/ILoginAPI.dart';
import 'package:fleetdrive/Services/FleepAPIServices/TransactionsAPI/ITransactionAPI.dart';
import 'package:fleetdrive/Services/FleepAPIServices/TransactionsAPI/TransactionAPI.dart';
import 'package:fleetdrive/Services/PlatformServices/PlatformNetworkCheckServices/IPlatformNetworkCheckService.dart';
import 'package:fleetdrive/Services/PlatformServices/PlatformNetworkCheckServices/PlatformNetworkCheckService.dart';
import 'package:fleetdrive/Services/PlatformServices/PlatformSecureStorageService/IPlatformSecureStorageService.dart';
import 'package:fleetdrive/Services/PlatformServices/PlatformSecureStorageService/PlatformSecureStorageService.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

late final bool isRooted;
Future<void> main() async {
  runZonedGuarded(() async {
    runApp(MyApp(isRooted: await checkIfDeviceIsRooted()));
  }, (error, stack) {
    print('Caught in zone: $error, stack: $stack');
  });

  initializeServices();
}

Future<bool> checkIfDeviceIsRooted() async {
  GetIt.instance
      .registerFactory<IDeviceRootCheckService>(() => DeviceRootCheckService());
  final IDeviceRootCheckService deviceRootCheckService =
      GetIt.instance<IDeviceRootCheckService>();

  ServiceResult<bool> rootedCheckResponse =
      await deviceRootCheckService.isDeviceRooted();
  return rootedCheckResponse.content ?? false;
}

Future<void> initializeServices() async {
  GetIt.instance.registerFactory<IGetBalanceAPI>(() => GetBalanceAPI());

  // register the service
  GetIt.instance.registerFactory<ILoginAPI>(() => LoginAPI());
  GetIt.instance.registerFactory<IPlatformSecureStorageService>(
      () => PlatformSecureStorageService());
  GetIt.instance.registerFactory<IPlatformNetworkCheckServices>(
      () => PlatformNetworkCheckService());
  GetIt.instance.registerFactory<ICardsAPI>(() => CardsAPI());
  GetIt.instance.registerFactory<ITransactionAPI>(() => TransactionAPI());
  GetIt.instance.registerFactory<IVehiclesAPI>(() => VehicleAPI());
}

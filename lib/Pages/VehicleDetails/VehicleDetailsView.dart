import 'package:fleetdrive/BOs/UserEntity.dart';
import 'package:fleetdrive/Services/FleepAPIServices/GetBalanceAPI/IGetBalanceAPI.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class VehicleScreenView extends StatefulWidget {
  const VehicleScreenView({super.key});

  @override
  State<VehicleScreenView> createState() => _VehicleScreenViewState();
}

class _VehicleScreenViewState extends State<VehicleScreenView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      IGetBalanceAPI getBalanceAPI = GetIt.instance<IGetBalanceAPI>();
      getBalanceAPI.retriveBalance(
          userEntity: UserEntity(entityId: "9677367036"));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text("data")],
      ),
    );
  }
}

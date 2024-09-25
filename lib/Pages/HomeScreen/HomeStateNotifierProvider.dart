import 'package:fleetdrive/BOs/RequestBOs/GetVehiclesRequest.dart';
import 'package:fleetdrive/BOs/RequestBOs/TransactionRequest.dart';
import 'package:fleetdrive/BOs/RequestBOs/UserEntity.dart';
import 'package:fleetdrive/BOs/ResponseBOs/GetCardsResponse.dart';
import 'package:fleetdrive/BOs/ResponseBOs/GetTransactionResponse.dart';
import 'package:fleetdrive/BOs/ResponseBOs/GetVehiclesResponse.dart';
import 'package:fleetdrive/BOs/ResponseBOs/UserBalanceResponse.dart';
import 'package:fleetdrive/Helpers/APIHandler.dart';
import 'package:fleetdrive/Services/FleepAPIServices/CardListAPI/ICardListAPI.dart';
import 'package:fleetdrive/Services/FleepAPIServices/GetBalanceAPI/IGetBalanceAPI.dart';
import 'package:fleetdrive/Services/FleepAPIServices/GetVehiclesAPI/IGetVehiclesAPI.dart';
import 'package:fleetdrive/Services/FleepAPIServices/TransactionsAPI/ITransactionAPI.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

// Base State Class
class BaseState<T> {
  final T? data;
  final bool isLoading;
  final String? error;

  BaseState({this.data, this.isLoading = false, this.error});
}

// Base Notifier Class
abstract class BaseNotifier<T, R> extends StateNotifier<BaseState<T>> {
  final R api;

  BaseNotifier(this.api) : super(BaseState<T>(data: null));

  Future<void> fetchData(
      Future<ServiceResult<T>> Function(R api) fetchFunction) async {
    state = BaseState<T>(isLoading: true);
    try {
      final result = await fetchFunction(api);
      if (result.content != null) {
        state = BaseState<T>(data: result.content, isLoading: false);
      } else {
        state = BaseState<T>(isLoading: false, error: result.statusMessage);
      }
    } catch (e) {
      state = BaseState<T>(isLoading: false, error: "Failed to fetch data.");
    }
  }
}

// Balance Notifier
class BalanceNotifier extends BaseNotifier<List<Balance>, IGetBalanceAPI> {
  BalanceNotifier(IGetBalanceAPI getBalanceAPI) : super(getBalanceAPI);

  Future<void> fetchBalance(String entityId) async {
    final userEntity = UserEntity(entityId: entityId);
    await fetchData((api) => api.retriveBalance(userEntity: userEntity));
  }
}

final balanceProvider =
    StateNotifierProvider<BalanceNotifier, BaseState<List<Balance>>>(
  (ref) {
    final getBalanceAPI = GetIt.instance<IGetBalanceAPI>();
    return BalanceNotifier(getBalanceAPI);
  },
);

// Vehicle Notifier
class VehicleNotifier extends BaseNotifier<List<PersonDetails>, IVehiclesAPI> {
  VehicleNotifier() : super(GetIt.instance<IVehiclesAPI>());

  Future<void> fetchVehicles(VehiclesRequest vehicleRequest) async {
    await fetchData(
        (api) => api.retrieveVehicles(vehicleRequest: vehicleRequest));
  }
}

final vehicleProvider =
    StateNotifierProvider<VehicleNotifier, BaseState<List<PersonDetails>>>(
  (ref) => VehicleNotifier(),
);

// Transaction Notifier
class TransactionNotifier
    extends BaseNotifier<List<Transaction>, ITransactionAPI> {
  TransactionNotifier() : super(GetIt.instance<ITransactionAPI>());

  Future<void> fetchTransactions(TransactionRequest transactionRequest) async {
    await fetchData((api) =>
        api.retrieveTransactions(transactionRequest: transactionRequest));
  }
}

final transactionProvider =
    StateNotifierProvider<TransactionNotifier, BaseState<List<Transaction>>>(
  (ref) => TransactionNotifier(),
);

// Card Notifier
class CardNotifier extends BaseNotifier<GetCardsResponse, ICardsAPI> {
  CardNotifier() : super(GetIt.instance<ICardsAPI>());

  Future<void> fetchCards(String entityId) async {
    final userEntity = UserEntity(entityId: entityId);
    await fetchData((api) => api.retrieveCards(userEntity: userEntity));
  }
}

final cardProvider =
    StateNotifierProvider<CardNotifier, BaseState<GetCardsResponse>>(
  (ref) => CardNotifier(),
);

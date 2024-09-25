import 'package:fleetdrive/BOs/ResponseBOs/GetTransactionResponse.dart';
import 'package:fleetdrive/BOs/RequestBOs/TransactionRequest.dart';
import 'package:fleetdrive/Helpers/APIHandler.dart';

abstract class ITransactionAPI {
  Future<ServiceResult<List<Transaction>>> retrieveTransactions(
      {required TransactionRequest transactionRequest});
}

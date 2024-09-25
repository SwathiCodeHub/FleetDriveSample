import 'package:dio/dio.dart';
import 'package:fleetdrive/BOs/ResponseBOs/GetTransactionResponse.dart';
import 'package:fleetdrive/BOs/RequestBOs/TransactionRequest.dart';
import 'package:fleetdrive/Helpers/APIHandler.dart';
import 'package:fleetdrive/Helpers/ServiceHelper.dart';
import 'package:fleetdrive/Services/FleepAPIServices/TransactionsAPI/ITransactionAPI.dart';
import 'package:fleetdrive/Services/PlatformServices/PlatformNetworkCheckServices/IPlatformNetworkCheckService.dart';
import 'package:get_it/get_it.dart';

class TransactionAPI implements ITransactionAPI {
  @override
  Future<ServiceResult<List<Transaction>>> retrieveTransactions(
      {required TransactionRequest transactionRequest}) async {
    try {
      final IPlatformNetworkCheckServices platformNetworkCheckServices =
          GetIt.instance<IPlatformNetworkCheckServices>();
      ServiceResult<bool> networkResponse =
          await platformNetworkCheckServices.checkNetworkConnectivity();

      if (networkResponse.content == true) {
        Dio dioInstance = await DioInstanceCreation.dioInstance();

        Map<String, dynamic> encodedTransaction = transactionRequest.toJson();

        Response fetchTransactionResponse = await dioInstance.post(
          "customer/fetchTransactions",
          data: encodedTransaction,
        );

        if (fetchTransactionResponse.statusMessage == "OK" ||
            fetchTransactionResponse.statusCode == 402) {
          final List<Transaction> transactions = (fetchTransactionResponse
                  .data['result'] as List)
              .map((transactionJson) => Transaction.fromJson(transactionJson))
              .toList();

          return ServiceResult(
            content: transactions,
            statusCode: fetchTransactionResponse.statusCode!,
            statusMessage: fetchTransactionResponse.statusMessage!,
          );
        } else {
          return ServiceResult(
            content: null,
            statusCode: 500,
            statusMessage: "System Exception",
          );
        }
      } else {
        return ServiceResult(
          content: null,
          statusCode: 503,
          statusMessage: "Network Issue",
        );
      }
    } catch (e) {
      return ServiceResult(
        content: null,
        statusCode: 500,
        statusMessage: "System Exception",
      );
    }
  }
}

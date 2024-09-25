class GetTransactionResponse {
  String? status;
  List<Transaction>? transactions;
  dynamic exception;
  Pagination? pagination;

  GetTransactionResponse({
    this.status,
    this.transactions,
    this.exception,
    this.pagination,
  });

  GetTransactionResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    transactions = json['result'] != null
        ? List<Transaction>.from(
            json['result'].map((v) => Transaction.fromJson(v)))
        : null; // Using List.from for clarity
    exception = json['exception'];
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'result': transactions?.map((v) => v.toJson()).toList(),
        'exception': exception,
        'pagination': pagination?.toJson(),
      };
}

class Transaction {
  int? transactionCounter;
  int? created;
  String? otherPartyId;
  String? otherPartyName;
  int? amount;
  int? combinedTxnRef;
  String? description;
  String? transactionStatus;
  String? transactionOrigin;
  String? transactionType;
  double? balance;
  String? externalTxnId;
  String? billRefNo;
  String? mcc;
  String? rrn;
  int? convertedAmount;
  String? kitNo;
  String? type;
  String? serialNo;
  String? cardType;
  String? entityType;
  String? entityId;

  Transaction({
    this.transactionCounter,
    this.created,
    this.otherPartyId,
    this.otherPartyName,
    this.amount,
    this.combinedTxnRef,
    this.description,
    this.transactionStatus,
    this.transactionOrigin,
    this.transactionType,
    this.balance,
    this.externalTxnId,
    this.billRefNo,
    this.mcc,
    this.rrn,
    this.convertedAmount,
    this.kitNo,
    this.type,
    this.serialNo,
    this.cardType,
    this.entityType,
    this.entityId,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    transactionCounter = json['transactionCounter'];
    created = json['created'];
    otherPartyId = json['otherPartyId'];
    otherPartyName = json['otherPartyName'];
    amount = json['amount'];
    combinedTxnRef = json['combinedTxnRef'];
    description = json['description'];
    transactionStatus = json['transactionStatus'];
    transactionOrigin = json['transactionOrigin'];
    transactionType = json['transactionType'];
    balance = json['balance'];
    externalTxnId = json['externalTxnId'];
    billRefNo = json['billRefNo'];
    mcc = json['mcc'];
    rrn = json['rrn'];
    convertedAmount = json['convertedAmount'];
    kitNo = json['kitNo'];
    type = json['type'];
    serialNo = json['serialNo'];
    cardType = json['cardType'];
    entityType = json['entityType'];
    entityId = json['entityId'];
  }

  Map<String, dynamic> toJson() => {
        'transactionCounter': transactionCounter,
        'created': created,
        'otherPartyId': otherPartyId,
        'otherPartyName': otherPartyName,
        'amount': amount,
        'combinedTxnRef': combinedTxnRef,
        'description': description,
        'transactionStatus': transactionStatus,
        'transactionOrigin': transactionOrigin,
        'transactionType': transactionType,
        'balance': balance,
        'externalTxnId': externalTxnId,
        'billRefNo': billRefNo,
        'mcc': mcc,
        'rrn': rrn,
        'convertedAmount': convertedAmount,
        'kitNo': kitNo,
        'type': type,
        'serialNo': serialNo,
        'cardType': cardType,
        'entityType': entityType,
        'entityId': entityId,
      };
}

class Pagination {
  bool? isList;
  int? pageSize;
  int? pageNo;
  int? totalPages;
  int? totalElements;

  Pagination({
    this.isList,
    this.pageSize,
    this.pageNo,
    this.totalPages,
    this.totalElements,
  });

  Pagination.fromJson(Map<String, dynamic> json) {
    isList = json['isList'];
    pageSize = json['pageSize'];
    pageNo = json['pageNo'];
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
  }

  Map<String, dynamic> toJson() => {
        'isList': isList,
        'pageSize': pageSize,
        'pageNo': pageNo,
        'totalPages': totalPages,
        'totalElements': totalElements,
      };
}

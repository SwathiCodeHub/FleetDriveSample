class UserBalanceResponse {
  String? status;
  int? statusCode;
  List<Balance>? result;
  dynamic exception;
  dynamic pagination;

  UserBalanceResponse(
      {this.status,
      this.statusCode,
      this.result,
      this.exception,
      this.pagination});

  UserBalanceResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    if (json['result'] != null) {
      result = <Balance>[];
      json['result'].forEach((v) {
        result!.add(new Balance.fromJson(v));
      });
    }
    exception = json['exception'];
    pagination = json['pagination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['exception'] = this.exception;
    data['pagination'] = this.pagination;
    return data;
  }
}

class Balance {
  String? entityId;
  String? productId;
  String? balance;
  String? lienBalance;

  Balance({this.entityId, this.productId, this.balance, this.lienBalance});

  Balance.fromJson(Map<String, dynamic> json) {
    entityId = json['entityId'];
    productId = json['productId'];
    balance = json['balance'];
    lienBalance = json['lienBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entityId'] = this.entityId;
    data['productId'] = this.productId;
    data['balance'] = this.balance;
    data['lienBalance'] = this.lienBalance;
    return data;
  }
}

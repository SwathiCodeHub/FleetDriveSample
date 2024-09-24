class UserBalanceResponse {
  String? status;
  int? statusCode;
  List<Result>? result;
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
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
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

class Result {
  String? entityId;
  String? productId;
  String? balance;
  String? lienBalance;

  Result({this.entityId, this.productId, this.balance, this.lienBalance});

  Result.fromJson(Map<String, dynamic> json) {
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

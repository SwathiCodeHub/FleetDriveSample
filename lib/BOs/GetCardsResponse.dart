class GetCardsResponse {
  String? status;
  List<Result>? result;
  dynamic exception;
  dynamic pagination;
  String? dob;
  int? statusCode;

  GetCardsResponse(
      {this.status,
      this.result,
      this.exception,
      this.pagination,
      this.dob,
      this.statusCode});

  GetCardsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    exception = json['exception'];
    pagination = json['pagination'];
    dob = json['dob'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['exception'] = this.exception;
    data['pagination'] = this.pagination;
    data['dob'] = this.dob;
    data['statusCode'] = this.statusCode;
    return data;
  }
}

class Result {
  String? cardNumber;
  String? kitNumber;
  String? expiryDate;
  String? cardStatus;
  String? cardType;
  String? networkType;

  Result(
      {this.cardNumber,
      this.kitNumber,
      this.expiryDate,
      this.cardStatus,
      this.cardType,
      this.networkType});

  Result.fromJson(Map<String, dynamic> json) {
    cardNumber = json['cardNumber'];
    kitNumber = json['kitNumber'];
    expiryDate = json['expiryDate'];
    cardStatus = json['cardStatus'];
    cardType = json['cardType'];
    networkType = json['networkType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardNumber'] = this.cardNumber;
    data['kitNumber'] = this.kitNumber;
    data['expiryDate'] = this.expiryDate;
    data['cardStatus'] = this.cardStatus;
    data['cardType'] = this.cardType;
    data['networkType'] = this.networkType;
    return data;
  }
}

class GetCardsResponse {
  String? status;
  List<Result>? results; // Changed 'result' to 'results' for clarity
  dynamic exception;
  dynamic pagination;
  String? dob;
  int? statusCode;

  GetCardsResponse({
    this.status,
    this.results,
    this.exception,
    this.pagination,
    this.dob,
    this.statusCode,
  });

  GetCardsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['result'] != null
        ? List<Result>.from(json['result'].map((v) => Result.fromJson(v)))
        : null; // Using List.from for clarity
    exception = json['exception'];
    pagination = json['pagination'];
    dob = json['dob'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'result': results?.map((v) => v.toJson()).toList(),
        'exception': exception,
        'pagination': pagination,
        'dob': dob,
        'statusCode': statusCode,
      };
}

class Result {
  String? cardNumber;
  String? kitNumber;
  String? expiryDate;
  String? cardStatus;
  String? cardType;
  String? networkType;

  Result({
    this.cardNumber,
    this.kitNumber,
    this.expiryDate,
    this.cardStatus,
    this.cardType,
    this.networkType,
  });

  Result.fromJson(Map<String, dynamic> json) {
    cardNumber = json['cardNumber'];
    kitNumber = json['kitNumber'];
    expiryDate = json['expiryDate'];
    cardStatus = json['cardStatus'];
    cardType = json['cardType'];
    networkType = json['networkType'];
  }

  Map<String, dynamic> toJson() => {
        'cardNumber': cardNumber,
        'kitNumber': kitNumber,
        'expiryDate': expiryDate,
        'cardStatus': cardStatus,
        'cardType': cardType,
        'networkType': networkType,
      };
}

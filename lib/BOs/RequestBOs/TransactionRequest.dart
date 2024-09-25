class TransactionRequest {
  String? corporate;
  int? pageNumber;
  String? pageSize;
  String? parentEntityId;

  TransactionRequest(
      {this.corporate, this.pageNumber, this.pageSize, this.parentEntityId});

  TransactionRequest.fromJson(Map<String, dynamic> json) {
    corporate = json['corporate'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    parentEntityId = json['parentEntityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['corporate'] = this.corporate;
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    data['parentEntityId'] = this.parentEntityId;
    return data;
  }
}

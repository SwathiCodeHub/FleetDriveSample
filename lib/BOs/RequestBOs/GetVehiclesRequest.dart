class VehiclesRequest {
  String? entityType;
  int? pageNumber;
  String? pageSize;
  String? parentEntityId;

  VehiclesRequest({
    this.entityType,
    this.pageNumber,
    this.pageSize,
    this.parentEntityId,
  });

  VehiclesRequest.fromJson(Map<String, dynamic> json)
      : entityType = json['entityType'],
        pageNumber = json['pageNumber'],
        pageSize = json['pageSize'],
        parentEntityId = json['parentEntityId'];

  Map<String, dynamic> toJson() => {
        'entityType': entityType,
        'pageNumber': pageNumber,
        'pageSize': pageSize,
        'parentEntityId': parentEntityId,
      };
}

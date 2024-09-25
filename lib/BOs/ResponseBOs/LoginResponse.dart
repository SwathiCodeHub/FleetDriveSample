class LoginResponse {
  String? status;
  String? accessToken;
  String? refreshToken;
  int? statusCode;
  String? kycStatus;
  String? defaultTenant;
  String? defaultEntityId;

  LoginResponse({
    this.status,
    this.accessToken,
    this.refreshToken,
    this.statusCode,
    this.kycStatus,
    this.defaultTenant,
    this.defaultEntityId,
  });

  LoginResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        accessToken = json['accessToken'],
        refreshToken = json['refreshToken'],
        statusCode = json['statusCode'],
        kycStatus = json['kycStatus'],
        defaultTenant = json['defaultTenant'],
        defaultEntityId = json['defaultEntityId'];

  Map<String, dynamic> toJson() => {
        'status': status,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'statusCode': statusCode,
        'kycStatus': kycStatus,
        'defaultTenant': defaultTenant,
        'defaultEntityId': defaultEntityId,
      };
}

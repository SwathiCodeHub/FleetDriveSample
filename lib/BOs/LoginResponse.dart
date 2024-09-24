class LoginResponse {
  String? status;
  String? accessToken;
  String? refreshToken;
  int? statusCode;
  String? kycStatus;
  String? defaultTenant;
  String? defaultEntityId;

  LoginResponse(
      {this.status,
      this.accessToken,
      this.refreshToken,
      this.statusCode,
      this.kycStatus,
      this.defaultTenant,
      this.defaultEntityId});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    statusCode = json['statusCode'];
    kycStatus = json['kycStatus'];
    defaultTenant = json['defaultTenant'];
    defaultEntityId = json['defaultEntityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    data['statusCode'] = this.statusCode;
    data['kycStatus'] = this.kycStatus;
    data['defaultTenant'] = this.defaultTenant;
    data['defaultEntityId'] = this.defaultEntityId;
    return data;
  }
}

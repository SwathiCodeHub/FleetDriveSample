class UserInfo {
  String? mobile;
  String? mpin;

  UserInfo({this.mobile, this.mpin});

  UserInfo.fromJson(Map<String, String> json) {
    mobile = json['mobile'];
    mpin = json['mpin'];
  }

  Map<String, String> toJson() {
    final Map<String, String> data = new Map<String, String>();
    data['mobile'] = this.mobile!;
    data['mpin'] = this.mpin!;
    return data;
  }
}

class UserEntity {
  String? entityId;

  UserEntity({this.entityId});

  UserEntity.fromJson(Map<String, String> json) {
    entityId = json['entityId'];
  }

  Map<String, String> toJson() {
    final Map<String, String> data = new Map<String, String>();
    data['entityId'] = this.entityId as String;
    return data;
  }
}

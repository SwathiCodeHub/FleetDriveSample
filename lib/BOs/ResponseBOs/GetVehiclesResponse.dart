class GetVehiclesResponse {
  String? status;
  VehiclesResult? result;

  GetVehiclesResponse({this.status, this.result});

  GetVehiclesResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        result = json['result'] != null
            ? VehiclesResult.fromJson(json['result'])
            : null;

  Map<String, dynamic> toJson() => {
        'status': status,
        'result': result?.toJson(),
      };
}

class VehiclesResult {
  List<PersonDetails>? result;

  VehiclesResult({this.result});

  VehiclesResult.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = (json['result'] as List)
          .map((v) => PersonDetails.fromJson(v))
          .toList();
    }
  }

  Map<String, dynamic> toJson() => {
        'result': result?.map((v) => v.toJson()).toList(),
      };
}

class PersonDetails {
  String? firstName;
  String? lastName;
  String? address;
  String? city;
  String? state;
  String? country;
  int? pincode;
  String? contactNo;
  int? specialDate;
  String? entityId;
  String? emailAddress;
  String? customerType;
  String? entityType;
  String? kitNo;
  String? kitStatus;
  String? registeredDate;
  String? profileId;
  String? serialNo;
  String? parentEntityId;

  PersonDetails({
    this.firstName,
    this.lastName,
    this.address,
    this.city,
    this.state,
    this.country,
    this.pincode,
    this.contactNo,
    this.specialDate,
    this.entityId,
    this.emailAddress,
    this.customerType,
    this.entityType,
    this.kitNo,
    this.kitStatus,
    this.registeredDate,
    this.profileId,
    this.serialNo,
    this.parentEntityId,
  });

  PersonDetails.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'],
        lastName = json['lastName'],
        address = json['address'],
        city = json['city'],
        state = json['state'],
        country = json['country'],
        pincode = json['pincode'],
        contactNo = json['contactNo'],
        specialDate = json['specialDate'],
        entityId = json['entityId'],
        emailAddress = json['emailAddress'],
        customerType = json['customerType'],
        entityType = json['entityType'],
        kitNo = json['kitNo'],
        kitStatus = json['kitStatus'],
        registeredDate = json['registeredDate'],
        profileId = json['profileId'],
        serialNo = json['serialNo'],
        parentEntityId = json['parentEntityId'];

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'address': address,
        'city': city,
        'state': state,
        'country': country,
        'pincode': pincode,
        'contactNo': contactNo,
        'specialDate': specialDate,
        'entityId': entityId,
        'emailAddress': emailAddress,
        'customerType': customerType,
        'entityType': entityType,
        'kitNo': kitNo,
        'kitStatus': kitStatus,
        'registeredDate': registeredDate,
        'profileId': profileId,
        'serialNo': serialNo,
        'parentEntityId': parentEntityId,
      };
}

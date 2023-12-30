class Claim {
  Claim({
    required this.claims,
  });
  late final List<Claims> claims;

  Claim.fromJson(Map<String, dynamic> json) {
    claims = List.from(json['claims']).map((e) => Claims.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['claims'] = claims.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Claims {
  Claims({
    required this.id,
    required this.userId,
    required this.driverCpr,
    required this.insuranceCompany,
    required this.ownerCpr,
    required this.phoneNumber,
    required this.email,
    required this.vehcileno,
    required this.surveydate,
    required this.remarks,
    required this.garageName,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int userId;
  late final String driverCpr;
  late final String insuranceCompany;
  late final String ownerCpr;
  late final String phoneNumber;
  late final String email;
  late final String vehcileno;
  late final String surveydate;
  late final String remarks;
  late final String garageName;
  late final String createdAt;
  late final String updatedAt;

  Claims.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    driverCpr = json['driver_cpr'];
    insuranceCompany = json['insurance_company'];
    ownerCpr = json['owner_cpr'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    vehcileno = json['vehcileno'];
    surveydate = json['surveydate'];
    remarks = json['remarks'];
    garageName = json['garage_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['driver_cpr'] = driverCpr;
    _data['insurance_company'] = insuranceCompany;
    _data['owner_cpr'] = ownerCpr;
    _data['phone_number'] = phoneNumber;
    _data['email'] = email;
    _data['vehcileno'] = vehcileno;
    _data['surveydate'] = surveydate;
    _data['remarks'] = remarks;
    _data['garage_name'] = garageName;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

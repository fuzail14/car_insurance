class Person {
  Person({
    this.success,
    this.data,
  });
  bool? success;
  Data? data;

  Person.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.fullName,
    required this.cprNumber,
    required this.mobileNumber,
    required this.confirmPassword,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String fullName;
  late final String cprNumber;
  late final String mobileNumber;
  late final String confirmPassword;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    cprNumber = json['cpr_number'];
    mobileNumber = json['mobile_number'];
    confirmPassword = json['confirm_password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['full_name'] = fullName;
    _data['cpr_number'] = cprNumber;
    _data['mobile_number'] = mobileNumber;
    _data['confirm_password'] = confirmPassword;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Person {
  Person({
    this.success,
    this.data,
    this.Bearer,
  });
  bool? success;
  Data? data;
  String? Bearer;

  Person.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = Data.fromJson(json['data']);
    Bearer = json['Bearer'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data!.toJson();
    _data['Bearer'] = Bearer;
    return _data;
  }
}

class Data {
  Data({
    this.id,
    this.companyId,
    this.locationId,
    this.currentLocation,
    this.loginType,
    this.name,
    this.firstName,
    this.lastName,
    this.mobileNo,
    this.userRoleId,
    this.email,
    this.emailVerifiedAt,
    this.plan,
    this.planExpireDate,
    this.requestedPlan,
    this.type,
    this.avatar,
    this.lang,
    this.mode,
    this.createdBy,
    this.defaultPipeline,
    this.deleteStatus,
    this.isActive,
    this.lastLoginAt,
    this.createdAt,
    this.updatedAt,
    this.messengerColor,
    this.darkMode,
    this.activeStatus,
    this.isEmailVerified,
    this.profile,
  });
  int? id;
  int? companyId;
  int? locationId;
  int? currentLocation;
  String? loginType;
  String? name;
  String? firstName;
  String? lastName;
  String? mobileNo;
  int? userRoleId;
  String? email;
  String? emailVerifiedAt;
  int? plan;
  Null? planExpireDate;
  int? requestedPlan;
  String? type;
  String? avatar;
  String? lang;
  String? mode;
  int? createdBy;
  int? defaultPipeline;
  int? deleteStatus;
  int? isActive;
  String? lastLoginAt;
  String? createdAt;
  String? updatedAt;
  String? messengerColor;
  int? darkMode;
  int? activeStatus;
  int? isEmailVerified;
  String? profile;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    locationId = json['location_id'];
    currentLocation = json['current_location'];
    loginType = null;
    name = json['name'];
    firstName = null;
    lastName = null;
    mobileNo = json['mobile_no'];
    userRoleId = null;
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    plan = json['plan'];
    planExpireDate = null;
    requestedPlan = json['requested_plan'];
    type = json['type'];
    avatar = json['avatar'];
    lang = json['lang'];
    mode = json['mode'];
    createdBy = json['created_by'];
    defaultPipeline = json['default_pipeline'];
    deleteStatus = json['delete_status'];
    isActive = json['is_active'];
    lastLoginAt = json['last_login_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    messengerColor = json['messenger_color'];
    darkMode = json['dark_mode'];
    activeStatus = json['active_status'];
    isEmailVerified = json['is_email_verified'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['company_id'] = companyId;
    _data['location_id'] = locationId;
    _data['current_location'] = currentLocation;
    _data['login_type'] = loginType;
    _data['name'] = name;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['mobile_no'] = mobileNo;
    _data['user_role_id'] = userRoleId;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['plan'] = plan;
    _data['plan_expire_date'] = planExpireDate;
    _data['requested_plan'] = requestedPlan;
    _data['type'] = type;
    _data['avatar'] = avatar;
    _data['lang'] = lang;
    _data['mode'] = mode;
    _data['created_by'] = createdBy;
    _data['default_pipeline'] = defaultPipeline;
    _data['delete_status'] = deleteStatus;
    _data['is_active'] = isActive;
    _data['last_login_at'] = lastLoginAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['messenger_color'] = messengerColor;
    _data['dark_mode'] = darkMode;
    _data['active_status'] = activeStatus;
    _data['is_email_verified'] = isEmailVerified;
    _data['profile'] = profile;
    return _data;
  }
}

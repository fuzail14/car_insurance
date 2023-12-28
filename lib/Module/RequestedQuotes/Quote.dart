class Quote {
  Quote({
    required this.quotes,
  });
  late final List<Quotes> quotes;

  Quote.fromJson(Map<String, dynamic> json) {
    quotes = List.from(json['quotes']).map((e) => Quotes.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['quotes'] = quotes.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Quotes {
  Quotes({
    required this.id,
    required this.userId,
    required this.companyId,
    required this.companyName,
    required this.sumInsured,
    required this.modelYear,
    required this.make,
    required this.model,
    required this.firstRegistrationDate,
    required this.premiumPrice,
    required this.motorName,
    required this.plateNumber,
    required this.expiryDate,
    required this.totalPremiumPrice,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int userId;
  late final String companyId;
  late final String companyName;
  late final String sumInsured;
  late final String modelYear;
  late final String make;
  late final String model;
  late final String firstRegistrationDate;
  late final String premiumPrice;
  late final String motorName;
  late final String plateNumber;
  late final String expiryDate;
  late final String totalPremiumPrice;
  late final String createdAt;
  late final String updatedAt;

  Quotes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    companyId = json['company_id'];
    companyName = json['company_name'];
    sumInsured = json['sum_insured'];
    modelYear = json['model_year'];
    make = json['make'];
    model = json['model'];
    firstRegistrationDate = json['first_registration_date'];
    premiumPrice = json['premium_price'];
    motorName = json['motor_name'];
    plateNumber = json['plate_number'];
    expiryDate = json['expiry_date'];
    totalPremiumPrice = json['total_premium_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['company_id'] = companyId;
    _data['company_name'] = companyName;
    _data['sum_insured'] = sumInsured;
    _data['model_year'] = modelYear;
    _data['make'] = make;
    _data['model'] = model;
    _data['first_registration_date'] = firstRegistrationDate;
    _data['premium_price'] = premiumPrice;
    _data['motor_name'] = motorName;
    _data['plate_number'] = plateNumber;
    _data['expiry_date'] = expiryDate;
    _data['total_premium_price'] = totalPremiumPrice;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

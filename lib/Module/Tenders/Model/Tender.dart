class Tender {
  Tender({
    required this.success,
    required this.tenders,
  });
  late final bool success;
  late final List<Tenders> tenders;

  Tender.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    tenders =
        List.from(json['tenders']).map((e) => Tenders.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['tenders'] = tenders.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Tenders {
  Tenders({
    required this.id,
    required this.companyId,
    this.menuType,
    this.isPackage,
    required this.title,
    required this.type,
    required this.endDate,
    required this.endTime,
    required this.promotion,
    required this.emailshow,
    required this.phoneshow,
    this.budget,
    required this.isPromot,
    this.businessOverview,
    this.facilitiesOverview,
    this.prodnservOverview,
    this.reasonforsale,
    this.industryPreference,
    this.locationPreference,
    this.assets,
    this.monthlySale,
    this.monthlySaleCurrency,
    //this.reportedSales,
    this.reportedSaleCurrency,
    this.targetSellingPrice,
    this.targetSellingPriceCurrency,
    this.physicalAssetsValue,
    this.physicalAssetsValueCurrency,
    required this.isic4Main,
    this.isic4Category,
    this.isic4Activity,
    required this.govtRequirement,
    required this.companyRequirement,
    this.image,
    this.attachment,
    this.shortDesc,
    this.categoryLevel1,
    this.categoryLevel2,
    this.categoryLevel3,
    required this.tenderType,
    this.segment,
    this.family,
    // this.class,
    this.commodity,
    this.paymentMode,
    this.unit,
    this.quantity,
    this.shippingMode,
    this.requestType,
    this.localContentTarget,
    this.agreementPeriod,
    this.agreementStartDate,
    this.deliveryStartDate,
    this.deliveryEndDate,
    this.locationType,
    this.country,
    this.state,
    this.district,
    this.streetName,
    this.zipCode,
    this.buildingNo,
    this.unitNo,
    this.city,
    this.professionalSummary,
    this.investmentClito,
    this.investmentSize,
    this.transactionReference,
    this.financialInvestment,
    this.runRateSales,
    this.ebitdaMargin,
    this.established,
    this.employeeCapacity,
    this.legalEntry,
    //this.reportedSales,
    required this.industries,
    this.qualifiedSectors,
    required this.description,
    this.scopeOfWork,
    this.requiredDocuments,
    this.advancePayment,
    this.paymentDistribution,
    this.contractStartDate,
    this.contractEndDate,
    this.listedBy,
    this.longDesc,
    this.latitude,
    this.longitude,
    this.timezone,
    this.localTime,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    required this.approval,
    required this.approvedAt,
    required this.companies,
  });
  late final int id;
  late final int companyId;
  late final Null menuType;
  late final Null isPackage;
  late final String title;
  late final String type;
  late final String endDate;
  late final String endTime;
  late final String promotion;
  late final String emailshow;
  late final String phoneshow;
  late final String? budget;
  late final String isPromot;
  late final Null businessOverview;
  late final Null facilitiesOverview;
  late final Null prodnservOverview;
  late final Null reasonforsale;
  late final Null industryPreference;
  late final String? locationPreference;
  late final Null assets;
  late final Null monthlySale;
  late final Null monthlySaleCurrency;
  //late final Null reportedSales;
  late final Null reportedSaleCurrency;
  late final Null targetSellingPrice;
  late final Null targetSellingPriceCurrency;
  late final Null physicalAssetsValue;
  late final Null physicalAssetsValueCurrency;
  late final int isic4Main;
  late final int? isic4Category;
  late final List<String>? isic4Activity;
  late final String govtRequirement;
  late final String companyRequirement;
  late final Null image;
  late final String? attachment;
  late final Null shortDesc;
  late final Null categoryLevel1;
  late final Null categoryLevel2;
  late final Null categoryLevel3;
  late final String tenderType;
  late final int? segment;
  late final int? family;
  //late final int? class;
  late final String? commodity;
  late final String? paymentMode;
  late final String? unit;
  late final int? quantity;
  late final String? shippingMode;
  late final String? requestType;
  late final Null localContentTarget;
  late final Null agreementPeriod;
  late final Null agreementStartDate;
  late final Null deliveryStartDate;
  late final Null deliveryEndDate;
  late final String? locationType;
  late final Null country;
  late final Null state;
  late final Null district;
  late final Null streetName;
  late final Null zipCode;
  late final Null buildingNo;
  late final Null unitNo;
  late final Null city;
  late final Null professionalSummary;
  late final Null investmentClito;
  late final Null investmentSize;
  late final Null transactionReference;
  late final Null financialInvestment;
  late final Null runRateSales;
  late final Null ebitdaMargin;
  late final Null established;
  late final Null employeeCapacity;
  late final Null legalEntry;
  //late final Null reportedSales;
  late final String industries;
  late final String? qualifiedSectors;
  late final String description;
  late final Null scopeOfWork;
  late final Null requiredDocuments;
  late final Null advancePayment;
  late final Null paymentDistribution;
  late final Null contractStartDate;
  late final Null contractEndDate;
  late final Null listedBy;
  late final Null longDesc;
  late final String? latitude;
  late final String? longitude;
  late final String? timezone;
  late final String? localTime;
  late final String status;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;
  late final int? createdBy;
  late final Null updatedBy;
  late final Null deletedBy;
  late final String approval;
  late final String approvedAt;
  late final Companies companies;

  Tenders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    menuType = null;
    isPackage = null;
    title = json['title'];
    type = json['type'];
    endDate = json['end_date'];
    endTime = json['end_time'];
    promotion = json['promotion'];
    emailshow = json['emailshow'];
    phoneshow = json['phoneshow'];
    budget = null;
    isPromot = json['isPromot'];
    businessOverview = null;
    facilitiesOverview = null;
    prodnservOverview = null;
    reasonforsale = null;
    industryPreference = null;
    locationPreference = null;
    assets = null;
    monthlySale = null;
    monthlySaleCurrency = null;
    //reportedSales = null;
    reportedSaleCurrency = null;
    targetSellingPrice = null;
    targetSellingPriceCurrency = null;
    physicalAssetsValue = null;
    physicalAssetsValueCurrency = null;
    isic4Main = json['isic4_main'];
    isic4Category = null;
    isic4Activity = null;
    govtRequirement = json['govt_requirement'];
    companyRequirement = json['company_requirement'];
    image = null;
    attachment = null;
    shortDesc = null;
    categoryLevel1 = null;
    categoryLevel2 = null;
    categoryLevel3 = null;
    tenderType = json['tender_type'];
    segment = null;
    family = null;
    //class = null;
    commodity = null;
    paymentMode = null;
    unit = null;
    quantity = null;
    shippingMode = null;
    requestType = null;
    localContentTarget = null;
    agreementPeriod = null;
    agreementStartDate = null;
    deliveryStartDate = null;
    deliveryEndDate = null;
    locationType = null;
    country = null;
    state = null;
    district = null;
    streetName = null;
    zipCode = null;
    buildingNo = null;
    unitNo = null;
    city = null;
    professionalSummary = null;
    investmentClito = null;
    investmentSize = null;
    transactionReference = null;
    financialInvestment = null;
    runRateSales = null;
    ebitdaMargin = null;
    established = null;
    employeeCapacity = null;
    legalEntry = null;
    //reportedSales = null;
    industries = json['industries'];
    qualifiedSectors = null;
    description = json['description'];
    scopeOfWork = null;
    requiredDocuments = null;
    advancePayment = null;
    paymentDistribution = null;
    contractStartDate = null;
    contractEndDate = null;
    listedBy = null;
    longDesc = null;
    latitude = null;
    longitude = null;
    timezone = null;
    localTime = null;
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
    createdBy = null;
    updatedBy = null;
    deletedBy = null;
    approval = json['approval'];
    approvedAt = json['approved_at'];
    companies = Companies.fromJson(json['companies']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['company_id'] = companyId;
    _data['menuType'] = menuType;
    _data['isPackage'] = isPackage;
    _data['title'] = title;
    _data['type'] = type;
    _data['end_date'] = endDate;
    _data['end_time'] = endTime;
    _data['promotion'] = promotion;
    _data['emailshow'] = emailshow;
    _data['phoneshow'] = phoneshow;
    _data['budget'] = budget;
    _data['isPromot'] = isPromot;
    _data['business_overview'] = businessOverview;
    _data['facilities_overview'] = facilitiesOverview;
    _data['prodnserv_overview'] = prodnservOverview;
    _data['reasonforsale'] = reasonforsale;
    _data['industry_preference'] = industryPreference;
    _data['location_preference'] = locationPreference;
    _data['assets'] = assets;
    _data['monthly_sale'] = monthlySale;
    _data['monthly_sale_currency'] = monthlySaleCurrency;
    //_data['reported_sales'] = reportedSales;
    _data['reported_sale_currency'] = reportedSaleCurrency;
    _data['target_selling_price'] = targetSellingPrice;
    _data['target_selling_price_currency'] = targetSellingPriceCurrency;
    _data['physical_assets_value'] = physicalAssetsValue;
    _data['physical_assets_value_currency'] = physicalAssetsValueCurrency;
    _data['isic4_main'] = isic4Main;
    _data['isic4_category'] = isic4Category;
    _data['isic4_activity'] = isic4Activity;
    _data['govt_requirement'] = govtRequirement;
    _data['company_requirement'] = companyRequirement;
    _data['image'] = image;
    _data['attachment'] = attachment;
    _data['shortDesc'] = shortDesc;
    _data['categoryLevel1'] = categoryLevel1;
    _data['categoryLevel2'] = categoryLevel2;
    _data['categoryLevel3'] = categoryLevel3;
    _data['tender_type'] = tenderType;
    _data['segment'] = segment;
    _data['family'] = family;
    //_data['class'] = class;
    _data['commodity'] = commodity;
    _data['payment_mode'] = paymentMode;
    _data['unit'] = unit;
    _data['quantity'] = quantity;
    _data['shipping_mode'] = shippingMode;
    _data['request_type'] = requestType;
    _data['local_content_target'] = localContentTarget;
    _data['agreement_period'] = agreementPeriod;
    _data['agreement_start_date'] = agreementStartDate;
    _data['delivery_start_date'] = deliveryStartDate;
    _data['delivery_end_date'] = deliveryEndDate;
    _data['location_type'] = locationType;
    _data['country'] = country;
    _data['state'] = state;
    _data['district'] = district;
    _data['street_name'] = streetName;
    _data['zip_code'] = zipCode;
    _data['building_no'] = buildingNo;
    _data['unit_no'] = unitNo;
    _data['city'] = city;
    _data['professionalSummary'] = professionalSummary;
    _data['investmentClito'] = investmentClito;
    _data['investmentSize'] = investmentSize;
    _data['transactionReference'] = transactionReference;
    _data['financialInvestment'] = financialInvestment;
    _data['runRateSales'] = runRateSales;
    _data['ebitdaMargin'] = ebitdaMargin;
    _data['established'] = established;
    _data['employeeCapacity'] = employeeCapacity;
    _data['legalEntry'] = legalEntry;
    // _data['reportedSales'] = reportedSales;
    _data['industries'] = industries;
    _data['qualified_sectors'] = qualifiedSectors;
    _data['description'] = description;
    _data['scope_of_work'] = scopeOfWork;
    _data['required_documents'] = requiredDocuments;
    _data['advance_payment'] = advancePayment;
    _data['payment_distribution'] = paymentDistribution;
    _data['contract_start_date'] = contractStartDate;
    _data['contract_end_date'] = contractEndDate;
    _data['listedBy'] = listedBy;
    _data['longDesc'] = longDesc;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['timezone'] = timezone;
    _data['local_time'] = localTime;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['created_by'] = createdBy;
    _data['updated_by'] = updatedBy;
    _data['deleted_by'] = deletedBy;
    _data['approval'] = approval;
    _data['approved_at'] = approvedAt;
    _data['companies'] = companies.toJson();
    return _data;
  }
}

class Companies {
  Companies({
    required this.id,
    required this.companyCode,
    required this.companyName,
    this.arCompanyName,
    this.businessType,
    this.description,
    required this.website,
    required this.countryCode,
    required this.mobileNo,
    this.phone,
    this.fax,
    required this.email,
    required this.zipCode,
    required this.street,
    required this.logo,
    required this.logoPath,
    required this.contactPersonName,
    required this.designation,
    required this.primaryActivity,
    required this.industry,
    required this.vatNo,
    required this.vatPercentage,
    required this.isVerified,
    required this.isPublic,
    required this.isBranch,
    required this.isDepartment,
    this.registrationNo,
    this.registrationDate,
    this.facebookLink,
    this.linkedinLink,
    this.twitterLink,
    this.companySectorId,
    this.legalStatusId,
    required this.status,
    this.createdBy,
    this.invitedId,
    this.currencyId,
    this.timezoneId,
    this.languageId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.verificationLink,
    this.otp,
    this.mainSegmentP,
    this.familyP,
    this.classP,
    this.commodityP,
    this.mainSegmentS,
    this.familyS,
    this.classS,
    this.commodityS,
    required this.isProfileEnabled,
    required this.isic4Main,
    required this.isic4Category,
    this.activity,
    this.subscriptionId,
    required this.network,
    required this.registrationRequirement,
    this.govtRequirement,
    this.companyRequirement,
    this.attachedFile,
  });
  late final int id;
  late final String companyCode;
  late final String companyName;
  late final String? arCompanyName;
  late final String? businessType;
  late final String? description;
  late final String website;
  late final String countryCode;
  late final String mobileNo;
  late final String? phone;
  late final String? fax;
  late final String email;
  late final int zipCode;
  late final String street;
  late final String logo;
  late final String logoPath;
  late final String contactPersonName;
  late final String designation;
  late final String primaryActivity;
  late final int industry;
  late final int vatNo;
  late final String vatPercentage;
  late final int isVerified;
  late final int isPublic;
  late final int isBranch;
  late final int isDepartment;
  late final String? registrationNo;
  late final String? registrationDate;
  late final Null facebookLink;
  late final Null linkedinLink;
  late final Null twitterLink;
  late final Null companySectorId;
  late final int? legalStatusId;
  late final String status;
  late final Null createdBy;
  late final Null invitedId;
  late final int? currencyId;
  late final Null timezoneId;
  late final int? languageId;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;
  late final Null verificationLink;
  late final Null otp;
  late final int? mainSegmentP;
  late final int? familyP;
  late final int? classP;
  late final String? commodityP;
  late final int? mainSegmentS;
  late final int? familyS;
  late final int? classS;
  late final String? commodityS;
  late final String isProfileEnabled;
  late final int isic4Main;
  late final int isic4Category;
  late final Null activity;
  late final int? subscriptionId;
  late final String network;
  late final String registrationRequirement;
  late final String? govtRequirement;
  late final String? companyRequirement;
  late final String? attachedFile;

  Companies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyCode = json['company_code'];
    companyName = json['company_name'];
    arCompanyName = null;
    businessType = null;
    description = null;
    website = json['website'];
    countryCode = json['country_code'];
    mobileNo = json['mobile_no'];
    phone = null;
    fax = null;
    email = json['email'];
    zipCode = json['zip_code'];
    street = json['street'];
    logo = json['logo'];
    logoPath = json['logo_path'];
    contactPersonName = json['contact_person_name'];
    designation = json['designation'];
    primaryActivity = json['primary_activity'];
    industry = json['industry'];
    vatNo = json['vat_no'];
    vatPercentage = json['vat_percentage'];
    isVerified = json['is_verified'];
    isPublic = json['is_public'];
    isBranch = json['is_branch'];
    isDepartment = json['is_department'];
    registrationNo = null;
    registrationDate = null;
    facebookLink = null;
    linkedinLink = null;
    twitterLink = null;
    companySectorId = null;
    legalStatusId = null;
    status = json['status'];
    createdBy = null;
    invitedId = null;
    currencyId = null;
    timezoneId = null;
    languageId = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
    verificationLink = null;
    otp = null;
    mainSegmentP = null;
    familyP = null;
    classP = null;
    commodityP = null;
    mainSegmentS = null;
    familyS = null;
    classS = null;
    commodityS = null;
    isProfileEnabled = json['isProfileEnabled'];
    isic4Main = json['isic4_main'];
    isic4Category = json['isic4_category'];
    activity = null;
    subscriptionId = null;
    network = json['network'];
    registrationRequirement = json['registration_requirement'];
    govtRequirement = null;
    companyRequirement = null;
    attachedFile = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['company_code'] = companyCode;
    _data['company_name'] = companyName;
    _data['ar_company_name'] = arCompanyName;
    _data['business_type'] = businessType;
    _data['description'] = description;
    _data['website'] = website;
    _data['country_code'] = countryCode;
    _data['mobile_no'] = mobileNo;
    _data['phone'] = phone;
    _data['fax'] = fax;
    _data['email'] = email;
    _data['zip_code'] = zipCode;
    _data['street'] = street;
    _data['logo'] = logo;
    _data['logo_path'] = logoPath;
    _data['contact_person_name'] = contactPersonName;
    _data['designation'] = designation;
    _data['primary_activity'] = primaryActivity;
    _data['industry'] = industry;
    _data['vat_no'] = vatNo;
    _data['vat_percentage'] = vatPercentage;
    _data['is_verified'] = isVerified;
    _data['is_public'] = isPublic;
    _data['is_branch'] = isBranch;
    _data['is_department'] = isDepartment;
    _data['registration_no'] = registrationNo;
    _data['registration_date'] = registrationDate;
    _data['facebook_link'] = facebookLink;
    _data['linkedin_link'] = linkedinLink;
    _data['twitter_link'] = twitterLink;
    _data['company_sector_id'] = companySectorId;
    _data['legal_status_id'] = legalStatusId;
    _data['status'] = status;
    _data['created_by'] = createdBy;
    _data['invited_id'] = invitedId;
    _data['currency_id'] = currencyId;
    _data['timezone_id'] = timezoneId;
    _data['language_id'] = languageId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['verification_link'] = verificationLink;
    _data['otp'] = otp;
    _data['main_segment_p'] = mainSegmentP;
    _data['family_p'] = familyP;
    _data['class_p'] = classP;
    _data['commodity_p'] = commodityP;
    _data['main_segment_s'] = mainSegmentS;
    _data['family_s'] = familyS;
    _data['class_s'] = classS;
    _data['commodity_s'] = commodityS;
    _data['isProfileEnabled'] = isProfileEnabled;
    _data['isic4_main'] = isic4Main;
    _data['isic4_category'] = isic4Category;
    _data['activity'] = activity;
    _data['subscription_id'] = subscriptionId;
    _data['network'] = network;
    _data['registration_requirement'] = registrationRequirement;
    _data['govt_requirement'] = govtRequirement;
    _data['company_requirement'] = companyRequirement;
    _data['attached_file'] = attachedFile;
    return _data;
  }
}

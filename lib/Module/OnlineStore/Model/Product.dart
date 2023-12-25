class Product {
  Product({
    required this.success,
    required this.products,
  });
  late final bool success;
  late final List<Products> products;

  Product.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    products =
        List.from(json['products']).map((e) => Products.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['products'] = products.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Products {
  Products({
    required this.id,
    required this.companyId,
    required this.name,
    this.manufacturer,
    this.manufacturerPartNo,
    this.countryId,
    this.description,
    required this.status,
    required this.code,
    this.alertQuantity,
    this.quantity,
    this.pDetails,
    this.taxRate,
    required this.hide,
    this.barcodeSymbology,
    required this.taxMethod,
    this.family,
    this.commodity,
    required this.inventoryInfo,
    this.segment,
    //this.class,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.productType,
    this.specification,
    this.warranty,
    this.refundPolicy,
    required this.promotion,
    required this.priceVisibility,
    required this.nationalProduct,
    required this.productNature,
    this.minQty,
    required this.salePrice,
    required this.purchasePrice,
    required this.unit,
    this.unitPrice,
    this.maxPrice,
    this.minPrice,
    this.vat,
    this.paymentMode,
    this.videoPath,
    this.videoName,
    this.productDocPath,
    this.productDocName,
    this.modelNo,
    this.brandId,
    this.packageId,
    required this.skuCode,
    this.serviceCharge,
    this.noServiceBooked,
    required this.companies,
  });
  late final int id;
  late final int companyId;
  late final String name;
  late final String? manufacturer;
  late final String? manufacturerPartNo;
  late final int? countryId;
  late final String? description;
  late final String status;
  late final String code;
  late final Null alertQuantity;
  late final Null quantity;
  late final Null pDetails;
  late final Null taxRate;
  late final int hide;
  late final Null barcodeSymbology;
  late final int taxMethod;
  late final int? family;
  late final int? commodity;
  late final String inventoryInfo;
  late final int? segment;
  //late final int? class;
  late final String createdAt;
  late final String? updatedAt;
  late final Null deletedAt;
  late final String productType;
  late final String? specification;
  late final String? warranty;
  late final String? refundPolicy;
  late final String promotion;
  late final String priceVisibility;
  late final String nationalProduct;
  late final String productNature;
  late final String? minQty;
  late final String salePrice;
  late final String purchasePrice;
  late final String unit;
  late final String? unitPrice;
  late final String? maxPrice;
  late final String? minPrice;
  late final String? vat;
  late final String? paymentMode;
  late final String? videoPath;
  late final String? videoName;
  late final String? productDocPath;
  late final String? productDocName;
  late final String? modelNo;
  late final int? brandId;
  late final Null packageId;
  late final String skuCode;
  late final String? serviceCharge;
  late final String? noServiceBooked;
  late final Companies companies;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    name = json['name'];
    manufacturer = null;
    manufacturerPartNo = null;
    countryId = null;
    description = null;
    status = json['status'];
    code = json['code'];
    alertQuantity = null;
    quantity = null;
    pDetails = null;
    taxRate = null;
    hide = json['hide'];
    barcodeSymbology = null;
    taxMethod = json['tax_method'];
    family = null;
    commodity = null;
    inventoryInfo = json['inventory_info'];
    segment = null;
    // class = null;
    createdAt = json['created_at'];
    updatedAt = null;
    deletedAt = null;
    productType = json['product_type'];
    specification = null;
    warranty = null;
    refundPolicy = null;
    promotion = json['promotion'];
    priceVisibility = json['price_visibility'];
    nationalProduct = json['national_product'];
    productNature = json['product_nature'];
    minQty = null;
    salePrice = json['sale_price'];
    purchasePrice = json['purchase_price'];
    unit = json['unit'];
    unitPrice = json['unit_price'];
    maxPrice = null;
    minPrice = null;
    vat = null;
    paymentMode = null;
    videoPath = null;
    videoName = null;
    productDocPath = null;
    productDocName = null;
    modelNo = json['model_no'];
    brandId = null;
    packageId = null;
    skuCode = json['sku_code'];
    serviceCharge = null;
    noServiceBooked = null;
    companies = Companies.fromJson(json['companies']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['company_id'] = companyId;
    _data['name'] = name;
    _data['manufacturer'] = manufacturer;
    _data['manufacturer_part_no'] = manufacturerPartNo;
    _data['country_id'] = countryId;
    _data['description'] = description;
    _data['status'] = status;
    _data['code'] = code;
    _data['alert_quantity'] = alertQuantity;
    _data['quantity'] = quantity;
    _data['p_details'] = pDetails;
    _data['tax_rate'] = taxRate;
    _data['hide'] = hide;
    _data['barcode_symbology'] = barcodeSymbology;
    _data['tax_method'] = taxMethod;
    _data['family'] = family;
    _data['commodity'] = commodity;
    _data['inventory_info'] = inventoryInfo;
    _data['segment'] = segment;
    // _data['class'] = class;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['product_type'] = productType;
    _data['specification'] = specification;
    _data['warranty'] = warranty;
    _data['refund_policy'] = refundPolicy;
    _data['promotion'] = promotion;
    _data['price_visibility'] = priceVisibility;
    _data['national_product'] = nationalProduct;
    _data['product_nature'] = productNature;
    _data['min_qty'] = minQty;
    _data['sale_price'] = salePrice;
    _data['purchase_price'] = purchasePrice;
    _data['unit'] = unit;
    _data['unit_price'] = unitPrice;
    _data['max_price'] = maxPrice;
    _data['min_price'] = minPrice;
    _data['vat'] = vat;
    _data['payment_mode'] = paymentMode;
    _data['video_path'] = videoPath;
    _data['video_name'] = videoName;
    _data['product_doc_path'] = productDocPath;
    _data['product_doc_name'] = productDocName;
    _data['model_no'] = modelNo;
    _data['brand_id'] = brandId;
    _data['package_id'] = packageId;
    _data['sku_code'] = skuCode;
    _data['service_charge'] = serviceCharge;
    _data['no_service_booked'] = noServiceBooked;
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
    this.website,
    required this.countryCode,
    required this.mobileNo,
    this.phone,
    this.fax,
    required this.email,
    required this.zipCode,
    required this.street,
    this.logo,
    this.logoPath,
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
    this.updatedAt,
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
    this.isic4Main,
    this.isic4Category,
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
  late final String? website;
  late final String countryCode;
  late final String mobileNo;
  late final String? phone;
  late final String? fax;
  late final String email;
  late final int zipCode;
  late final String street;
  late final String? logo;
  late final String? logoPath;
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
  late final String? facebookLink;
  late final String? linkedinLink;
  late final String? twitterLink;
  late final int? companySectorId;
  late final int? legalStatusId;
  late final String status;
  late final int? createdBy;
  late final Null invitedId;
  late final int? currencyId;
  late final int? timezoneId;
  late final int? languageId;
  late final String createdAt;
  late final String? updatedAt;
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
  late final int? isic4Main;
  late final int? isic4Category;
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
    website = null;
    countryCode = json['country_code'];
    mobileNo = json['mobile_no'];
    phone = null;
    fax = null;
    email = json['email'];
    zipCode = json['zip_code'];
    street = json['street'];
    logo = null;
    logoPath = null;
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
    updatedAt = null;
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
    isic4Main = null;
    isic4Category = null;
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

class Api {
  static const String imageBaseUrl = 'http://127.0.0.1:8000/uploads/logo/';
  static const String originalImageBaseUrl = 'http://127.0.0.1:8000/';

  static const String baseUrl = 'http://127.0.0.1:8000/api/';
  static const String login = baseUrl + "loginWithMobileNumber";
  static const String bussinesCommunities =
      baseUrl + "marketplace/bussinesCommunity/bussinesCommunityView";

  static const String bussinesCommunityFilter =
      baseUrl + "marketplace/bussinesCommunity/bussinesCommunityFilter";

  static const String bussinesCommunityIsicFilter =
      baseUrl + "marketplace/bussinesCommunity/bussinesCommunityIsicFilter";

  static const String onlineStoreView =
      baseUrl + "marketplace/OnlineStore/onlineStoreView";

  static const String bussinesForSale =
      baseUrl + "marketplace/BussinesForSale/bussinesForSale";
  static const String tendersApi = baseUrl + "marketplace/Tenders/TendersApi";
  static const String generalServicesApi =
      baseUrl + "marketplace/GeneralServices/GeneralServicesApi";

  static const String investmentOpportunityUrl =
      baseUrl + "marketplace/InvestmentOpportunity/InvestmentOpportunityApi";
}

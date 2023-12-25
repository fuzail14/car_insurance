import 'dart:developer';

import 'package:car_insurance_app/Module/BussinesCommunity/Model/BussinesCommunity.dart';

import '../../Constants/api_routes.dart';
import '../../Module/OnlineStore/Model/Product.dart';
import '../../Services/Network Services/network_services.dart';

class OnlineStoreRepository {
  final networkServices = NetworkServices();

  Future<Product> onlineStoreViewApi({
    required bearerToken,
  }) async {
    var response = await networkServices.getReq("${Api.onlineStoreView}",
        bearerToken: bearerToken);
    log(response.toString());

    return Product.fromJson(response);
  }

  Future<BussinesCommunity> bussinesTypeFilterApi(
      {required bearerToken, required type}) async {
    var response = await networkServices.getReq(
        "${Api.bussinesCommunityFilter}/$type",
        bearerToken: bearerToken);
    log(response.toString());

    return BussinesCommunity.fromJson(response);
  }

  Future<BussinesCommunity> bussinesCommunityIsicFilterApi(
      {required bearerToken, required type}) async {
    var response = await networkServices.getReq(
        "${Api.bussinesCommunityIsicFilter}/$type",
        bearerToken: bearerToken);
    log(response.toString());

    return BussinesCommunity.fromJson(response);
  }
}

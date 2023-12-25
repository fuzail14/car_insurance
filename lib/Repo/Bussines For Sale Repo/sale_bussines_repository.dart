import 'dart:developer';
import '../../Constants/api_routes.dart';
import '../../Module/BussinesForSale/Model/SaleBussines.dart';
import '../../Services/Network Services/network_services.dart';

class SaleBussinesRepository {
  final networkServices = NetworkServices();

  Future<SaleBussines> BussinesForSaleResponse({
    required bearerToken,
  }) async {
    var response = await networkServices.getReq("${Api.bussinesForSale}",
        bearerToken: bearerToken);
    log(response.toString());

    return SaleBussines.fromJson(response);
  }
}

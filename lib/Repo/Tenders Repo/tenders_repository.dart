import 'dart:developer';
import '../../Constants/api_routes.dart';
import '../../Module/Tenders/Model/Tender.dart';
import '../../Services/Network Services/network_services.dart';

class TendersRepository {
  final networkServices = NetworkServices();

  Future<Tender> TendersResponse({
    required bearerToken,
  }) async {
    var response = await networkServices.getReq("${Api.tendersApi}",
        bearerToken: bearerToken);
    log(response.toString());

    return Tender.fromJson(response);
  }
}

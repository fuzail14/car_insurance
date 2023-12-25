import 'dart:developer';
import 'package:car_insurance_app/Module/GeneralServices/Model/GeneralService.dart';
import '../../Constants/api_routes.dart';
import '../../Services/Network Services/network_services.dart';

class GeneralServiceRepository {
  final networkServices = NetworkServices();

  Future<GeneralService> ServicesResponse({
    required bearerToken,
  }) async {
    var response = await networkServices.getReq("${Api.generalServicesApi}",
        bearerToken: bearerToken);
    log(response.toString());

    return GeneralService.fromJson(response);
  }
}

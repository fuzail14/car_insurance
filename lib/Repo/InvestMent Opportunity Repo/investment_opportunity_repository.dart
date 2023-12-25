import 'dart:developer';
import '../../Constants/api_routes.dart';
import '../../Module/InvestMentOpportunity/Model/InvestMentOpportunity.dart';
import '../../Services/Network Services/network_services.dart';

class InvestMentOpportunityRepository {
  final networkServices = NetworkServices();

  Future<InvestMentOpportunity> InvestMentOpportunityResponse({
    required bearerToken,
  }) async {
    var response = await networkServices.getReq(Api.investmentOpportunityUrl,
        bearerToken: bearerToken);
    log(response.toString());

    return InvestMentOpportunity.fromJson(response);
  }
}

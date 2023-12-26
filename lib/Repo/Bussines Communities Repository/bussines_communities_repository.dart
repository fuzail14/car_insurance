// import 'dart:developer';

// import 'package:car_insurance_app/Module/BussinesCommunity/Model/BussinesCommunity.dart';

// import '../../Constants/api_routes.dart';
// import '../../Services/Network Services/network_services.dart';

// class BussinessCommunitiesRepository {
//   final networkServices = NetworkServices();

//   Future<BussinesCommunity> bussinesCommunitiesViewApi() async {
//     var response = await networkServices.getReq(
//       "${Api.bussinesCommunities}",
//     );
//     log(response.toString());

//     return BussinesCommunity.fromJson(response);
//   }

//   Future<BussinesCommunity> bussinesTypeFilterApi({required type}) async {
//     var response = await networkServices.getReq(
//       "${Api.bussinesCommunityFilter}/$type",
//     );
//     log(response.toString());

//     return BussinesCommunity.fromJson(response);
//   }

//   Future<BussinesCommunity> bussinesCommunityIsicFilterApi(
//       {required bearerToken, required type}) async {
//     var response = await networkServices.getReq(
//         "${Api.bussinesCommunityIsicFilter}/$type",
//         bearerToken: bearerToken);
//     log(response.toString());

//     return BussinesCommunity.fromJson(response);
//   }
// }

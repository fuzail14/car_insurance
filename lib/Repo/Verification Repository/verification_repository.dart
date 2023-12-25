import '../../Constants/api_routes.dart';
import '../../Services/Network Services/network_services.dart';

class LoginRepository {
  final networkServices = NetworkServices();

  Future<dynamic> loginApi(data) async {
    var response = await networkServices.postFormReq(Api.login, data);
    return response;
  }
}

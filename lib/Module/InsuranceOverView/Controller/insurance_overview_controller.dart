import 'package:get/get.dart';

class InsuranceOverviewController extends GetxController {
  var arguments = Get.arguments;

  var data;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    data = arguments;
    print(data);
  }
}

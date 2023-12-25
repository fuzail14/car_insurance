import 'package:get/get.dart';

import '../../../Constants/Person/person.dart';

import 'package:get/get.dart';
import '../../../Constants/Person/person.dart';

class MarketPlaceController extends GetxController {
  var arguments = Get.arguments;

  // Sample data for market places
  final List<MarketPlaceItem> marketPlaces = [
    MarketPlaceItem(
      title: 'Business Community',
      description: 'It serves as a comprehensive directory...',
      route: '/businessCommunity',
    ),
    MarketPlaceItem(
      title: 'Online Store',
      description: 'It hosts an online store providing a platform...',
      route: '/onlineStore',
    ),
    // Add more items as needed
  ];
}

class MarketPlaceItem {
  final String title;
  final String description;
  final String route;

  MarketPlaceItem({
    required this.title,
    required this.description,
    required this.route,
  });
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/constants.dart';

class Loader extends GetView {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    print('come here loader');
    return Center(
      child: CupertinoActivityIndicator(
          radius: 20.0, color: CupertinoColors.activeBlue),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetsAdTips extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? adEvent;
  const WidgetsAdTips({Key? key, required this.imageUrl, this.adEvent})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Center(
            child: GestureDetector(
          onTap: () {
            Get.back();
            if (adEvent != null) {
              adEvent!();
            }
          },
          child: Image.network(imageUrl),
        )),
      ),
    );
  }
}

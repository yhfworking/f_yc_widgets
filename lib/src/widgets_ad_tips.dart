import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:flutter/material.dart';

class WidgetsAdTips extends StatelessWidget {
  final String imageUrl;
  final GestureTapCallback? onTap;
  const WidgetsAdTips({Key? key, required this.imageUrl, this.onTap})
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
            if (onTap != null) {
              onTap!();
            }
          },
          child: Image.network(imageUrl),
        )),
      ),
    );
  }
}

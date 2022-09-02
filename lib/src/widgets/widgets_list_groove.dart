import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';

class WidgetsListGroove extends StatelessWidget {
  final Color? color;
  final double? height;
  const WidgetsListGroove({Key? key, this.color, this.height = 10.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: height,
      color: color ?? Colors.grey[100],
    );
  }
}

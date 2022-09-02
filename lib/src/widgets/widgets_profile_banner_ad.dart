import 'package:f_yc_config/f_yc_config.dart';
import 'package:f_yc_pangle/f_yc_pangle.dart';
import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';

// ignore: must_be_immutable
class WidgetsProfileBannerAd extends StatelessWidget {
  double? width = Get.width;
  WidgetsProfileBannerAd({Key? key, this.width}) : super(key: key);

  Widget _widget() {
    String pangleProfileBannerAdId = YcConfig.pangleProfileBannerAdId();
    if (GetUtils.isNull(pangleProfileBannerAdId)) {
      return Container(
        width: width ?? Get.width,
        height: width! / 4.0,
        color: Colors.white,
      );
    }
    return Container(
        width: width ?? Get.width,
        height: width != null ? width! / 4.0 : Get.width / 4.0,
        color: Colors.white,
        child: AspectRatio(
            aspectRatio: 4.0,
            child: Center(
              child: AdBannerWidget(
                posId: pangleProfileBannerAdId,
                width: width != null ? width!.toInt() : Get.width.toInt(),
                height: (width != null ? width! / 4.0 : Get.width / 4.0)
                    .toDouble()
                    .toInt(),
                interval: 30,
                show: true,
                autoClose: false,
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return _widget();
  }
}

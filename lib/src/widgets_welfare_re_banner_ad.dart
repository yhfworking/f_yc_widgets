import 'package:f_yc_config/f_yc_config.dart';
import 'package:f_yc_pangle/f_yc_pangle.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:flutter/material.dart';

class WidgetsWelfareReBannerAd extends StatelessWidget {
  const WidgetsWelfareReBannerAd({Key? key}) : super(key: key);

  Widget _widget() {
    String pangleWelfareReBannerAdId = YcConfig.pangleWelfareReBannerAdId();
    if (GetUtils.isNull(pangleWelfareReBannerAdId)) {
      return Container(
        width: Get.width,
        height: Get.width / 4.0,
        color: Colors.white,
      );
    }
    return Container(
        width: Get.width,
        height: Get.width / 4.0,
        color: Colors.white,
        child: AspectRatio(
            aspectRatio: 600.0 / 150.0,
            child: Center(
              child: AdBannerWidget(
                  posId: pangleWelfareReBannerAdId,
                  width: Get.width.toInt(),
                  height: (Get.width / 4.0).toDouble().toInt(),
                  interval: 30,
                  show: true),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return _widget();
  }
}

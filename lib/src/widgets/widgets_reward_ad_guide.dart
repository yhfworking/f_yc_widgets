import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetsRewardAdGuide extends StatefulWidget {
  final String rewardType;
  final VoidCallback showRewardVideoAdEvent;
  const WidgetsRewardAdGuide(
      {Key? key,
      required this.rewardType,
      required this.showRewardVideoAdEvent})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WidgetsRewardAdGuideState createState() => _WidgetsRewardAdGuideState();
}

class _WidgetsRewardAdGuideState extends State<WidgetsRewardAdGuide> {
  double _progressValue = 0.0;

  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {
        _progressValue = _progressValue + 0.01;
      });
      if (_progressValue >= 1.0) {
        timer.cancel();
        widget.showRewardVideoAdEvent();
        // YcPangle.showRewardVideoAd(
        //   customData: widget.rewardType,
        // );
        Get.back();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width,
              height: 50,
              child: const Text(
                '恭喜获得金币',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            SizedBox(
                width: Get.width * 3.0 / 5.0,
                height: Get.width * 3.0 / 5.0,
                child: Image.asset('assets/images/sign_reward_guide_icon.png',
                    package: 'f_yc_widgets', fit: BoxFit.fill)),
            Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                width: Get.width / 2.0,
                height: 18,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(9)),
                  child: LinearProgressIndicator(
                    value: _progressValue,
                    backgroundColor: Colors.red[100],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.redAccent),
                  ),
                )),
            SizedBox(
              width: Get.width,
              height: 50,
              child: const Text(
                '看完广告即可到账...',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

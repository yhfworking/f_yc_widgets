import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'plugin_gift_sign/plugin_gift_sign.dart';

enum SignType { cashSign }

class PluginSign extends StatelessWidget {
  final SignType signType;
  final int? continuitySignTimes;
  final bool? isSignToday;
  final bool? isContinuity3RewardEnable;
  final bool? isContinuity7RewardEnable;
  final bool? isContinuity30RewardEnable;
  final bool? isContinuity365RewardEnable;
  final VoidCallback? signAction;
  final ContinuityDaysSignCallback? continuityDaysSignAction;
  const PluginSign(
      {Key? key,
      required this.signType,
      this.continuitySignTimes = 0,
      this.isSignToday = false,
      this.isContinuity3RewardEnable = false,
      this.isContinuity7RewardEnable = false,
      this.isContinuity30RewardEnable = false,
      this.isContinuity365RewardEnable = false,
      this.signAction,
      this.continuityDaysSignAction})
      : super(key: key);

  Widget _widget() {
    if (signType == SignType.cashSign) {
      double offset =
          max(0, (Get.width / 5.0 + 10) * (continuitySignTimes! - 1));
      ScrollController scrollController =
          ScrollController(initialScrollOffset: offset);
      Future.delayed(const Duration(seconds: 1), () {
        if (scrollController.hasClients) {
          scrollController.animateTo(offset,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOut);
        }
      });
      return PluginGiftSign(
        continuitySignTimes: continuitySignTimes,
        isSignToday: isSignToday,
        isContinuity3RewardEnable: isContinuity3RewardEnable,
        isContinuity7RewardEnable: isContinuity7RewardEnable,
        isContinuity30RewardEnable: isContinuity30RewardEnable,
        isContinuity365RewardEnable: isContinuity365RewardEnable,
        signAction: signAction,
        continuityDaysSignAction: continuityDaysSignAction,
        scrollController: scrollController,
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(width: Get.width, color: Colors.white, child: _widget());
  }
}

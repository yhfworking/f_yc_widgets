import 'package:f_yc_config/f_yc_config.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:flutter/material.dart';
import 'widgets/index.dart';

typedef ContinuityDaysSignCallback = void Function(int days);

class PluginGiftSign extends StatelessWidget {
  final int? continuitySignTimes;
  final bool? isSignToday;
  final bool? isContinuity3RewardEnable;
  final bool? isContinuity7RewardEnable;
  final bool? isContinuity30RewardEnable;
  final bool? isContinuity365RewardEnable;
  final VoidCallback? signAction;
  final ContinuityDaysSignCallback? continuityDaysSignAction;
  final ScrollController scrollController;
  const PluginGiftSign({
    Key? key,
    required this.scrollController,
    this.continuitySignTimes = 0,
    this.isSignToday = false,
    this.isContinuity3RewardEnable = false,
    this.isContinuity7RewardEnable = false,
    this.isContinuity30RewardEnable = false,
    this.isContinuity365RewardEnable = false,
    this.signAction,
    this.continuityDaysSignAction,
  }) : super(key: key);
  void setss() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: Get.width,
          height: Get.width / 5.0 + 30,
          child: Center(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                int day = index + 1;
                if (index < continuitySignTimes!) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SignRewardItem(
                        isNormal: true,
                      ),
                      Container(
                        width: Get.width / 5.0,
                        height: 30,
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          '$day天',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SignRewardItem(
                      isAnimation: isSignToday!
                          ? false
                          : (index == continuitySignTimes! ? true : false),
                    ),
                    Container(
                      width: Get.width / 5.0,
                      height: 30,
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        '第$day天',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                );
              },
              itemCount: 30,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: SignButton(
            isSignToday: isSignToday,
            signAction: signAction,
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '已连续签到 ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: YcConfig.primarySubTextColor()),
                ),
                Text(
                  continuitySignTimes!.toString(),
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFF5F5F),
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  ' 天',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: YcConfig.primarySubTextColor()),
                ),
              ],
            )),
        Container(
          width: Get.width - 20,
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          padding: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
            color: Color(0xFFF6F6F6),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: Get.width - 40,
                height: 40,
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: const Center(
                  child: Text(
                    '连续签到，大额惊喜红包领不停！',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SignRewardMore(
                rewardTips: '最高1元',
                targetDays: 3,
                continuitySignTimes: continuitySignTimes!,
                isEnableSign: isContinuity3RewardEnable!,
                onPressedCallback: () {
                  if (continuityDaysSignAction != null) {
                    continuityDaysSignAction!(3);
                  }
                },
              ),
              SignRewardMore(
                rewardTips: '最高5元',
                targetDays: 7,
                continuitySignTimes: continuitySignTimes!,
                isEnableSign: isContinuity7RewardEnable!,
                onPressedCallback: () {
                  if (continuityDaysSignAction != null) {
                    continuityDaysSignAction!(7);
                  }
                },
              ),
              SignRewardMore(
                rewardTips: '最高20元',
                targetDays: 30,
                continuitySignTimes: continuitySignTimes!,
                isEnableSign: isContinuity30RewardEnable!,
                onPressedCallback: () {
                  if (continuityDaysSignAction != null) {
                    continuityDaysSignAction!(30);
                  }
                },
              ),
              SignRewardMore(
                rewardTips: '2000元',
                targetDays: 365,
                continuitySignTimes: continuitySignTimes!,
                isEnableSign: isContinuity365RewardEnable!,
                onPressedCallback: () {
                  if (continuityDaysSignAction != null) {
                    continuityDaysSignAction!(365);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

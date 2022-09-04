import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:flutter/material.dart';

class SignRewardMore extends StatefulWidget {
  final String rewardTips;
  final int targetDays;
  final int continuitySignTimes;
  final bool isEnableSign;
  final VoidCallback? onPressedCallback;
  const SignRewardMore(
      {Key? key,
      required this.rewardTips,
      required this.continuitySignTimes,
      required this.targetDays,
      required this.isEnableSign,
      this.onPressedCallback})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignRewardMoreState createState() => _SignRewardMoreState();
}

class _SignRewardMoreState extends State<SignRewardMore>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scale;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    _scale = Tween(begin: 1.0, end: 1.1).animate(_animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isEnableSign) {
      _animationController.stop();
    } else {
      _animationController.reset();
      _animationController.forward();
    }
    return Container(
      width: Get.width - 40,
      height: 100,
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 90,
              height: 90,
              child: Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/sign_cash_reward_bg.png',
                          package: 'f_yc_widgets'),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          widget.rewardTips,
                          style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          SizedBox(
            width: Get.width - 230,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width - 240,
                  height: 20,
                  child: Text(
                    '连续签到${widget.targetDays}天',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                    width: Get.width - 230,
                    height: 8,
                    margin: const EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      child: LinearProgressIndicator(
                        value: widget.continuitySignTimes != 0
                            ? widget.continuitySignTimes / widget.targetDays
                            : 0,
                        backgroundColor: Colors.red[100],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.redAccent),
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '第1天',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '第${widget.targetDays}天',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
              width: 100,
              height: 36,
              child: Center(
                  child: ScaleTransition(
                scale: _scale,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        widget.isEnableSign
                            ? const Color(0xFFFF5F5F)
                            : const Color(0xFFF2F2F2)),
                    shape: MaterialStateProperty.all(const StadiumBorder()),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  onPressed:
                      widget.isEnableSign ? widget.onPressedCallback : null,
                  child: Text(
                    '领红包',
                    style: TextStyle(
                        color:
                            widget.isEnableSign ? Colors.white : Colors.black12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ))),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

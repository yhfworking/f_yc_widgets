import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:flutter/material.dart';

class SignRewardItem extends StatefulWidget {
  final bool? isAnimation;
  final bool? isNormal;
  const SignRewardItem(
      {Key? key, this.isAnimation = false, this.isNormal = false})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignRewardItemState createState() => _SignRewardItemState();
}

class _SignRewardItemState extends State<SignRewardItem>
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
    if (widget.isAnimation!) {
      _animationController.reset();
      _animationController.forward();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isAnimation!) {
      _animationController.stop();
    }
    return SizedBox(
        width: Get.width / 5.0,
        height: Get.width / 5.0,
        child: ScaleTransition(
          scale: _scale,
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: widget.isNormal!
                    ? const AssetImage(
                        'assets/images/sign_cash_item_bg_normal.png')
                    : const AssetImage('assets/images/sign_cash_item_bg.png'),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
                  child: Text(
                    widget.isNormal! ? '已领取' : '惊喜红包',
                    style: TextStyle(
                      color: widget.isNormal! ? Colors.white70 : Colors.white,
                      fontSize: 11,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

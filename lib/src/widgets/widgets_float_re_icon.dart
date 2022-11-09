import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetsFloatReIcon extends StatefulWidget {
  final bool? isSignToday;
  final VoidCallback iconEvent;
  const WidgetsFloatReIcon(
      {Key? key, this.isSignToday = false, required this.iconEvent})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WidgetsFloatReIconState createState() => _WidgetsFloatReIconState();
}

class _WidgetsFloatReIconState extends State<WidgetsFloatReIcon>
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
    _scale = Tween(begin: 0.8, end: 1.2).animate(_animationController);
    _animationController.reset();
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isSignToday!) {
      _animationController.stop();
    }
    return ScaleTransition(
      scale: _scale,
      child: SizedBox(
        width: Get.width / 6.0,
        height: Get.width / 6.0,
        child: Center(
            child: GestureDetector(
          onTap: widget.iconEvent,
          // onTap: () {
          // if (!FYcConfig.isLogin()) {
          //   Get.toNamed(YcRoutesNames.login);
          //   return;
          // }
          // LoadingUtils.show();
          // Future.delayed(const Duration(milliseconds: 1500), () {
          //   LoadingUtils.dismiss();
          //   Get.dialog(const WidgetsRewardAdGuide(
          //     rewardType: 'timerRewardRe',
          //   ));
          // });
          // },
          child: Image.network(
              'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-5353f2f4-024c-4eb4-81ef-2022670f7bfe/faa95949-abf9-4a13-be17-176309590de2.png'),
        )),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

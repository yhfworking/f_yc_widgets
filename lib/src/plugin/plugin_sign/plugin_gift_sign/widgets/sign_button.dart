import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:flutter/material.dart';

class SignButton extends StatefulWidget {
  final bool? isSignToday;
  final VoidCallback? signAction;
  const SignButton({Key? key, this.isSignToday = false, this.signAction})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignButtonState createState() => _SignButtonState();
}

class _SignButtonState extends State<SignButton>
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
    _animationController.reset();
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isSignToday!) {
      _animationController.stop();
    }
    double width = Get.width * 4 / 5.0;
    return ScaleTransition(
      scale: _scale,
      child: SizedBox(
          width: width,
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(widget.isSignToday!
                    ? const Color(0xFFF2F2F2)
                    : const Color(0xFFFF5F5F)),
                shape: MaterialStateProperty.all(const StadiumBorder()),
                elevation: MaterialStateProperty.all(0),
              ),
              onPressed: widget.signAction,
              child: Container(
                margin: const EdgeInsets.only(top: 12, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      size: 22,
                      color:
                          widget.isSignToday! ? Colors.black45 : Colors.white,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Text(
                        widget.isSignToday! ? '今天已签到' : '立即签到',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: widget.isSignToday!
                                ? Colors.black87
                                : Colors.white),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

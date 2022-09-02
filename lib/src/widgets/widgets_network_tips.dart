import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';

class WidgetsNetworkTips extends StatelessWidget {
  const WidgetsNetworkTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth = Get.width - 80;
    double cardHeight = cardWidth * 5.0 / 4.0 + 20;
    double iconHeight = cardHeight - 130;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Center(
        child: SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: Colors.white), //
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  width: cardWidth,
                  height: 50,
                  child: const Text(
                    '网络连接异常',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                    width: cardWidth,
                    height: iconHeight,
                    child: Image.asset('assets/images/error_netwrork_bg.png',
                        fit: BoxFit.fill)),
                Container(
                  width: cardWidth,
                  height: 80,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(4)),
                      color: Colors.white), //
                  child: Center(
                    child: SizedBox(
                      width: cardWidth - 30,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFFe94339)),
                            elevation: MaterialStateProperty.all(0)),
                        child: const Text(
                          '稍后重试',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

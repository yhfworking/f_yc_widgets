import 'package:f_yc_widgets/f_yc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetsAppPraise extends StatelessWidget {
  final VoidCallback appPraiseEvent;
  const WidgetsAppPraise({Key? key, required this.appPraiseEvent})
      : super(key: key);

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
                    '请先完成应用好评！',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: iconHeight,
                  child: Image.asset('assets/images/app_praise_icon.png',
                      package: 'f_yc_widgets', fit: BoxFit.fill),
                ),
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
                        onPressed: appPraiseEvent,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                FYcWidgets.commonConfig.primaryColor),
                            elevation: MaterialStateProperty.all(0)),
                        child: const Text(
                          '去给五星好评',
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

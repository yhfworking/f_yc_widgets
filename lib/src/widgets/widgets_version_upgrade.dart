import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:flutter/material.dart';

class WidgetsVersionUpgrade extends StatelessWidget {
  final String url;
  final String? title;
  final String? note;

  const WidgetsVersionUpgrade(
      {Key? key, required this.url, this.title, this.note})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth = Get.width - 80;
    double topBgHeight = cardWidth * 204.0 / 450.0;
    double cardHeight = cardWidth * 5.0 / 4.0 + 20;
    double textHeight = cardHeight - topBgHeight - 80;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Center(
        child: SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ), //
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: cardWidth,
                  height: topBgHeight,
                  child: Image.asset('assets/images/version_upgrade_bg.png',
                      fit: BoxFit.fill),
                ),
                Container(
                  width: cardWidth,
                  height: textHeight,
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: cardWidth,
                        child: Text(
                          title ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5),
                        width: cardWidth,
                        child: Text(
                          note ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
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
                      onPressed: () async {
                        Get.back();
                        await launchUrl(Uri.parse(url));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0XFFe94339)),
                          elevation: MaterialStateProperty.all(0)),
                      child: const Text(
                        '立即更新',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

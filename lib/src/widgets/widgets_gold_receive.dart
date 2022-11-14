import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetsGoldReceive extends StatelessWidget {
  final int? amount;
  final String buttonText;
  final VoidCallback buttonEvent;
  const WidgetsGoldReceive(
      {Key? key,
      this.amount,
      required this.buttonText,
      required this.buttonEvent})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Get.width,
        height: Get.width * 81.0 / 75.0,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/gold_receive_bg.png',
                  package: 'f_yc_widgets')),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: const Text('恭喜您获得',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: Text.rich(TextSpan(
                text: amount.toString(),
                style: GoogleFonts.righteous(
                    fontSize: 38.0,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFFED525)),
                children: const [
                  TextSpan(
                    text: ' 个金币',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              )),
            ),
            Container(
              width: Get.width * 46.0 / 75.0,
              height: 48,
              margin: const EdgeInsets.only(bottom: 50),
              child: ElevatedButton(
                onPressed: buttonEvent,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFFFEB01)),
                    elevation: MaterialStateProperty.all(0)),
                child: Text(
                  buttonText,
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

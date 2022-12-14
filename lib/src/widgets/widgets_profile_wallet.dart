import 'package:f_yc_widgets/f_yc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetsProfileWallet extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final String? btnTitle;
  final int? balance;
  final String? money;
  final VoidCallback walletEvent;
  final VoidCallback submitCashEvent;
  const WidgetsProfileWallet(
      {Key? key,
      this.icon,
      this.title,
      this.btnTitle,
      this.balance = 0,
      this.money,
      required this.walletEvent,
      required this.submitCashEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: walletEvent,
      child: Container(
        height: 100,
        width: Get.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width - 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon ??
                      Container(
                        margin: const EdgeInsets.only(right: 4),
                        width: 20,
                        height: 20,
                        child: Image.asset('assets/icons/icon_gold.png',
                            package: 'f_yc_widgets', fit: BoxFit.fill),
                      ),
                  Text(
                    title ?? '我的金币',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          balance != 0 ? balance.toString() : '0',
                          style: GoogleFonts.oswald(
                              fontSize: 26,
                              color: const Color(0xFFFFAA16),
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 6, left: 6),
                          child: Text.rich(TextSpan(
                            text: money,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                            ),
                            children: const [
                              TextSpan(
                                text: '元',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                      width: 100,
                      child: Center(
                          child: SizedBox(
                        width: 72,
                        height: 34,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape:
                                MaterialStateProperty.all(const StadiumBorder(
                                    side: BorderSide(
                              style: BorderStyle.solid,
                              color: Color(0xffFF7F24),
                            ))),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            foregroundColor: MaterialStateProperty.all(
                                FYcWidgets.commonConfig.primaryColor),
                            elevation: MaterialStateProperty.all(0),
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold)),
                            side: MaterialStateProperty.all(BorderSide(
                                width: 1, color: Colors.grey.shade300)), //边框
                          ),
                          onPressed: submitCashEvent,
                          child: Text(btnTitle ?? '去提现'),
                        ),
                      )))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

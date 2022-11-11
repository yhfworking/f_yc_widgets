import 'package:f_yc_widgets/f_yc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';

// ignore: must_be_immutable
class WidgetsCashOutOptions extends StatelessWidget {
  final int balance;
  final String money;
  final VoidCallback submitCashOutEvent;
  WidgetsCashOutOptions(
      {Key? key,
      required this.balance,
      required this.money,
      required this.submitCashOutEvent})
      : super(key: key);
  int _amount = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              '可兑现金额:',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: FYcWidgets.commonConfig.primaryColor),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                balance.toString(),
                style: GoogleFonts.oswald(
                    fontSize: 36,
                    color: const Color(0xFFFFAA16),
                    fontWeight: FontWeight.w500),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text.rich(TextSpan(
                  text: money,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: FYcWidgets.commonConfig.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: '元',
                      style: TextStyle(
                          color: FYcWidgets.commonConfig.primarySubTextColor,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: GroupButton(
              isRadio: true,
              onSelected: (dynamic value, int index, bool isSelected) async {
                if (index == 0) {
                  _amount = 1000;
                } else if (index == 1) {
                  _amount = 10000;
                } else if (index == 2) {
                  _amount = 30000;
                } else if (index == 3) {
                  _amount = 100000;
                }
              },
              options: GroupButtonOptions(
                buttonWidth: (Get.width - 40) / 2.0,
                buttonHeight: 60,
                groupingType: GroupingType.wrap,
                spacing: 10,
                runSpacing: 10,
                direction: Axis.horizontal,
                selectedTextStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: FYcWidgets.commonConfig.primaryColor,
                ),
                unselectedTextStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: FYcWidgets.commonConfig.primarySubTextColor,
                ),
                selectedColor: Colors.white,
                unselectedColor: Colors.grey[100] ?? Colors.white,
                selectedBorderColor: FYcWidgets.commonConfig.primaryColor,
                unselectedBorderColor: Colors.grey[300] ?? Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                selectedShadow: const <BoxShadow>[
                  BoxShadow(color: Colors.transparent)
                ],
                unselectedShadow: const <BoxShadow>[
                  BoxShadow(color: Colors.transparent)
                ],
              ),
              buttons: const [
                "     1.00元\n售1000金币",
                "    10.00元\n售10000金币",
                "    30.00元\n售30000金币",
                "     100.00元\n售100000金币",
              ],
            ),
          ),
          Expanded(child: Container()),
          SizedBox(
            height: 50,
            width: Get.width - 30,
            child: ElevatedButton(
              onPressed: submitCashOutEvent,
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(
                      FYcWidgets.commonConfig.primaryColor)),
              child: const Text(
                '提交申请',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

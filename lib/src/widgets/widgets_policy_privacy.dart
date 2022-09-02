import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:get_storage/get_storage.dart';

class WidgetsPolicyPrivacy extends StatelessWidget {
  final Color? primaryColor;
  final GestureTapCallback? userAgreementEventCallBack;
  final GestureTapCallback? privacyPolicyEventCallBack;
  const WidgetsPolicyPrivacy(
      {Key? key,
      this.primaryColor,
      this.userAgreementEventCallBack,
      this.privacyPolicyEventCallBack})
      : super(key: key);

  final TextStyle _lowProfileStyle = const TextStyle(
    fontSize: 16.0,
    color: Color(0xFF4A4A4A),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Get.width - 80,
        height: (Get.width - 80) * 5.0 / 4.0,
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  "用户协议和隐私",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(15),
                  child: Text.rich(TextSpan(
                    text:
                        '请你务必认真阅读、充分理解“服务协议”和“隐私政策”各条款，包括但不限于：为了向你提供数据、分享等服务所要获取的权限信息。你可以阅读',
                    style: _lowProfileStyle,
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = userAgreementEventCallBack,
                        text: '《服务协议》',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: primaryColor,
                        ),
                      ),
                      TextSpan(
                        text: '和',
                        style: _lowProfileStyle,
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = privacyPolicyEventCallBack,
                        text: '《隐私政策》',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: primaryColor,
                        ),
                      ),
                      TextSpan(
                        text: '了解详细信息。如您同意，请点击"同意"开始接受我们的服务。',
                        style: _lowProfileStyle,
                      ),
                    ],
                  ))),
              Container(
                width: double.infinity,
                height: 60,
                margin: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {
                          exit(0);
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey),
                            elevation: MaterialStateProperty.all(0)),
                        child: const Text(
                          '不同意退出',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () async {
                          await GetStorage().write(
                              'Storage_Key_Is_Sign_Privacy_Policy', true);
                          Get.back();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor),
                            elevation: MaterialStateProperty.all(0)),
                        child: const Text(
                          '同意',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

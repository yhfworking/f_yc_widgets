import 'package:f_yc_pages/f_yc_pages.dart';
import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';
import 'widgets_header_user.dart';

enum HeaderType { normal }

class WidgetsProfileHeader extends StatelessWidget {
  final HeaderType itemType;
  final String nickname;
  final String itro;
  final String avatar;
  const WidgetsProfileHeader(
      {Key? key,
      required this.itemType,
      required this.nickname,
      required this.itro,
      required this.avatar})
      : super(key: key);

  Widget _getWidgets() {
    if (itemType == HeaderType.normal) {
      return WidgetsHeaderUser(
        nickname: nickname,
        itro: itro,
        avatar: avatar,
        gestureTapCallback: () {
          Get.toNamed(YcRoutesNames.userInfo);
        },
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return _getWidgets();
  }
}

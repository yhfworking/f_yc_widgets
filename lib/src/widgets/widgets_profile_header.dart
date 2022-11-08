import 'package:flutter/material.dart';
import 'widgets_profile_user_info.dart';

enum HeaderType { avatarLeft, avatarRight }

class WidgetsProfileHeader extends StatelessWidget {
  final HeaderType itemType;
  final String nickname;
  final String itro;
  final String avatar;
  final GestureTapCallback? gestureTapCallback;
  const WidgetsProfileHeader(
      {Key? key,
      required this.itemType,
      required this.nickname,
      required this.itro,
      required this.avatar,
      this.gestureTapCallback})
      : super(key: key);

  Widget _getWidgets() {
    if (itemType == HeaderType.avatarLeft) {
      return WidgetsProfileUserInfo(
        isAvatarRight: false,
        nickname: nickname,
        itro: itro,
        avatar: avatar,
        gestureTapCallback: gestureTapCallback,
      );
    } else if (itemType == HeaderType.avatarRight) {
      return WidgetsProfileUserInfo(
        isAvatarRight: true,
        nickname: nickname,
        itro: itro,
        avatar: avatar,
        gestureTapCallback: gestureTapCallback,
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return _getWidgets();
  }
}

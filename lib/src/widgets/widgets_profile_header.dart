import 'package:flutter/material.dart';
import 'widgets_profile_user_info.dart';

enum HeaderType { avatarLeft, avatarRight }

class WidgetsProfileHeader extends StatelessWidget {
  final HeaderType itemType;
  final String nickname;
  final String itro;
  final String avatar;
  final VoidCallback userInfoEvent;
  const WidgetsProfileHeader(
      {Key? key,
      required this.itemType,
      required this.nickname,
      required this.itro,
      required this.avatar,
      required this.userInfoEvent})
      : super(key: key);

  Widget _getWidgets() {
    if (itemType == HeaderType.avatarLeft) {
      return WidgetsProfileUserInfo(
        isAvatarRight: false,
        nickname: nickname,
        itro: itro,
        avatar: avatar,
        userInfoEvent: userInfoEvent,
      );
    } else if (itemType == HeaderType.avatarRight) {
      return WidgetsProfileUserInfo(
        isAvatarRight: true,
        nickname: nickname,
        itro: itro,
        avatar: avatar,
        userInfoEvent: userInfoEvent,
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return _getWidgets();
  }
}

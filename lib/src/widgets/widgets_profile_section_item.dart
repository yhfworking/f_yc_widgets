import 'package:flutter/material.dart';
import 'index.dart';

enum ItemType {
  setting,
  appPraise,
  myWallet,
  openCustomerService,
  shareAppToWxSession,
  shareAppToWxTimeline
}

class WidgetsProfileSectionItem extends StatelessWidget {
  final ItemType? itemType;
  final String? title;
  final Icon? icon;
  final bool? isArrow;
  final Widget? infoWidget;
  final GestureTapCallback? onTap;
  const WidgetsProfileSectionItem(
      {Key? key,
      this.itemType,
      this.title,
      this.icon,
      this.isArrow,
      this.infoWidget,
      this.onTap})
      : super(key: key);

  Widget _getWidgets() {
    if (itemType == ItemType.setting) {
      return WidgetsListItem(
          icon: icon ?? const Icon(Icons.tune_outlined),
          title: title ?? '更多设置',
          isArrow: isArrow ?? true,
          onTap: onTap);
    } else if (itemType == ItemType.appPraise) {
      return WidgetsListItem(
          icon: icon ?? const Icon(Icons.star_border_outlined),
          title: title ?? '应用评分',
          isArrow: isArrow ?? true,
          onTap: onTap);
    } else if (itemType == ItemType.openCustomerService) {
      return WidgetsListItem(
          icon: icon ?? const Icon(Icons.star_border_outlined),
          title: title ?? '联系客服',
          isArrow: isArrow ?? true,
          onTap: onTap);
    } else if (itemType == ItemType.shareAppToWxSession) {
      return WidgetsListItem(
          icon: icon ?? const Icon(Icons.group_add_outlined),
          title: title ?? '邀请好友',
          isArrow: isArrow ?? true,
          onTap: onTap);
    } else if (itemType == ItemType.shareAppToWxTimeline) {
      return WidgetsListItem(
          icon: icon ?? const Icon(Icons.group_add_outlined),
          title: title ?? '邀请好友',
          isArrow: isArrow ?? true,
          onTap: onTap);
    } else if (itemType == ItemType.myWallet) {
      return WidgetsListItem(
          icon: icon ?? const Icon(Icons.wallet_membership_outlined),
          title: title ?? '我的钱包',
          isArrow: isArrow ?? true,
          onTap: onTap);
    }
    return WidgetsListItem(
        icon: icon, title: title, isArrow: isArrow, onTap: onTap);
  }

  @override
  Widget build(BuildContext context) {
    return _getWidgets();
  }
}

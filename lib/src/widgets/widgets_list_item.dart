import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetsListItem extends StatelessWidget {
  final Icon? icon;
  final String? title;
  final bool? isArrow;
  final Widget? infoWidget;
  final GestureTapCallback? onTap;
  const WidgetsListItem(
      {Key? key,
      this.icon,
      this.title,
      this.isArrow,
      this.infoWidget,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(color: Colors.grey.shade200, width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon != null
                ? Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Center(
                      child: icon,
                    ))
                : Container(),
            SizedBox(
              width: Get.width - 140,
              child: Text(
                title ?? '',
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              width: 50,
              height: 50,
              child: Center(
                child: infoWidget ?? Container(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: isArrow ?? false
                  ? const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                      size: 22,
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}

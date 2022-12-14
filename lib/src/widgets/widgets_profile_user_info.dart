import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetsProfileUserInfo extends StatelessWidget {
  final bool isAvatarRight;
  final String nickname;
  final String itro;
  final String avatar;
  final VoidCallback userInfoEvent;
  const WidgetsProfileUserInfo(
      {Key? key,
      required this.isAvatarRight,
      required this.nickname,
      required this.itro,
      required this.avatar,
      required this.userInfoEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isAvatarRight) {
      return Container(
        height: 120,
        color: Colors.white,
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: userInfoEvent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: Get.width / 2.0,
                margin: const EdgeInsets.only(left: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nickname,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        itro,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                  width: 66,
                  height: 66,
                  child: avatar.isEmpty
                      ? Image.asset('assets/images/default_avatar.png',
                          package: 'f_yc_widgets', fit: BoxFit.fill)
                      : CircleAvatar(
                          radius: 33,
                          backgroundColor: Colors.white70,
                          backgroundImage: NetworkImage(avatar),
                        )),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 120,
        color: Colors.white,
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: userInfoEvent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 66,
                  height: 66,
                  child: avatar.isEmpty
                      ? Image.asset('assets/images/default_avatar.png',
                          package: 'f_yc_widgets', fit: BoxFit.fill)
                      : CircleAvatar(
                          radius: 33,
                          backgroundColor: Colors.white70,
                          backgroundImage: NetworkImage(avatar),
                        )),
              Container(
                width: Get.width / 2.0,
                margin: const EdgeInsets.only(left: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nickname,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        itro,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

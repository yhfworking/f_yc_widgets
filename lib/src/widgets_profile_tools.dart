import 'package:f_yc_config/f_yc_config.dart';
import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';

enum ProfileToolsType { square, dailyTasks, introduction, ranking }

class WidgetsProfileTools extends StatelessWidget {
  final List<ProfileToolsType> toolsTypes;
  const WidgetsProfileTools({
    Key? key,
    required this.toolsTypes,
  }) : super(key: key);

  Widget _widget(int index) {
    if (index >= 0 && index < toolsTypes.length) {
      ProfileToolsType toolsType = toolsTypes[index];
      String iconUrl =
          'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-5353f2f4-024c-4eb4-81ef-2022670f7bfe/da6741b5-a2ea-4ef7-832f-231d64c4d864.png';
      String title = '';
      String routesName = '';
      if (toolsType == ProfileToolsType.square) {
        iconUrl =
            'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-5353f2f4-024c-4eb4-81ef-2022670f7bfe/239b777c-dc2a-4abb-af0a-acd70339ff35.png';
        title = '金币广场';
        routesName = YcRoutesNames.dailyTask;
      } else if (toolsType == ProfileToolsType.dailyTasks) {
        iconUrl =
            'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-5353f2f4-024c-4eb4-81ef-2022670f7bfe/0d75e44d-e95d-4103-be25-4a43f4090527.png';
        title = '日常任务';
        routesName = YcRoutesNames.dailyTask;
      } else if (toolsType == ProfileToolsType.introduction) {
        iconUrl =
            'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-5353f2f4-024c-4eb4-81ef-2022670f7bfe/455b3911-e5c6-43ca-bab9-fd802295b56d.png';
        title = '金币攻略';
        routesName = YcRoutesNames.goldIntroRe;
      } else if (toolsType == ProfileToolsType.ranking) {
        iconUrl =
            'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-5353f2f4-024c-4eb4-81ef-2022670f7bfe/50b6ee88-2234-4b38-896c-277f79add36a.png';
        title = '排行榜';
        routesName = YcRoutesNames.ranking;
      }
      return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Get.toNamed(routesName);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.network(
                    iconUrl,
                    fit: BoxFit.fitHeight,
                  )),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.normal),
                ),
              )
            ],
          ));
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      color: Colors.white,
      padding: const EdgeInsets.only(top: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 0, mainAxisSpacing: 0),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _widget(index);
        },
        itemCount: toolsTypes.length,
      ),
    );
  }
}

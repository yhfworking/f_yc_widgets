library f_yc_widgets;

import 'package:f_yc_config/f_yc_config.dart';
export 'src/widgets/index.dart';
export 'src/plugin/index.dart';

class FYcWidgets {
  static FYcConfigCommonConfig commonConfig = FYcConfigConfigurator.instance
      .getConfig(configId: KIT_CONFIG_ID)
      .commonConfig;
}

import 'package:flutter/material.dart';

import 'pages/pages.dart';

/// @Describe: 项目路由管理
///
/// @Author: LiWeNHuI
/// @Date: 2022/6/11

class Routes {
  /// 启动
  static String splash = '/splash';

  /// 主页面
  static String main = '/main';

  /// 路由管理
  static Map<String, WidgetBuilder> get routes {
    return <String, WidgetBuilder>{
      splash: (_) => const SplashPage(),
      main: (_) => const MainPage(),
    };
  }

  /// 根路由
  static String get initialRoute => splash;
}

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'routes.dart';
import 'utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// 透明状态栏、导航栏
  await redoSystemStyle();

  /// 启动项目
  runApp(const MyApp());
}

/// 程序主体
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget',
      routes: Routes.routes,
      initialRoute: Routes.initialRoute,
      locale: const Locale('zh', 'CN'),
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[Locale('zh', 'CN')],
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
    );
  }
}

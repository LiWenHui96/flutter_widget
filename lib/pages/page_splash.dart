import 'package:flutter/material.dart';
import 'package:flutter_widget/config/config.dart';
import 'package:flutter_widget/routes.dart';

/// @Describe: 启动页
///
/// @Author: LiWeNHuI
/// @Date: 2022/6/11

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BaseState<SplashPage> {
  FlutterLogoStyle _style = FlutterLogoStyle.markOnly;
  final double iconSize = 160;

  @override
  void initState() {
    super.initState();

    Future<void>.delayed(
      Duration.zero,
      () => setState(() => _style = FlutterLogoStyle.stacked),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          decoration: FlutterLogoDecoration(style: _style),
          width: iconSize,
          height: iconSize,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(seconds: 3),
          onEnd: () {
            Future<void>.delayed(
              const Duration(milliseconds: 500),
              () => Navigator.pushReplacementNamed(context, Routes.main),
            );
          },
        ),
      ),
    );
  }
}

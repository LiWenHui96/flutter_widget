import 'package:flutter/material.dart';
import 'package:flutter_widget/config/config.dart';
import 'package:flutter_widget/routes.dart';

/// @Describe: 启动页
///
/// @Author: LiWeNHuI
/// @Date: 2022/6/11

class SplashPage extends StatefulWidget {
  /// 外部调用
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BasePageState<SplashPage> {
  FlutterLogoStyle _style = FlutterLogoStyle.markOnly;
  final double iconSize = 160;
  final Duration duration = const Duration(milliseconds: 1500);

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
          decoration: FlutterLogoDecoration(
            textColor: Theme.of(context).colorScheme.secondary,
            style: _style,
          ),
          width: iconSize,
          height: iconSize,
          curve: Curves.fastOutSlowIn,
          duration: duration,
          onEnd: () {
            Future<void>.delayed(
              duration,
              () => Navigator.pushReplacementNamed(context, Routes.main),
            );
          },
        ),
      ),
    );
  }
}

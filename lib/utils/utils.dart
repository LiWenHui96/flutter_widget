import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

export 'util_log.dart';

/// @Describe: 公共方法类
///
/// @Author: LiWeNHuI
/// @Date: 2022/6/11

/// 对于状态栏、导航栏整体处理
Future<void> redoSystemStyle({bool isPortrait = true}) async {
  await redoOrientation(isPortrait: isPortrait);

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarContrastEnforced: true,
    ),
  );
}

/// 对于横竖屏的处理
Future<void> redoOrientation({bool isPortrait = true}) async {
  if (isPortrait) {
    /// 竖屏
    await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]);
  } else {
    /// 横屏
    await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}

/// 展示 SnackBar
void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
    ),
  );
}

/// 链接跳转的小组件
Widget launchUrlWidget(BuildContext context, String url) {
  return GestureDetector(
    onTap: () async => toLaunchUrl(url),
    child: Container(
      margin: const EdgeInsets.only(top: 5),
      child: Text(
        url,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          decoration: TextDecoration.underline,
        ),
      ),
    ),
  );
}

/// 链接跳转
Future<bool> toLaunchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    /// Android 平台 采用跳转到外部浏览器
    /// 其他平台，采用平台默认方式
    return launchUrl(uri);
  } else {
    throw ArgumentError('Could not launch $url');
  }
}

/// 消除 SnackBar
void removeSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
}

/// 获取设备底边栏高度
double get bottomBarHeight => MediaQueryData.fromWindow(window).padding.bottom;

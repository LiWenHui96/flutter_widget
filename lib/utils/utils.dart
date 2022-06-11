import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

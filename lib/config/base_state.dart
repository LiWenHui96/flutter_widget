import 'package:flutter/material.dart';
import 'package:flutter_widget/utils/utils.dart';

/// @Describe:
///
/// @Author: LiWeNHuI
/// @Date: 2022/6/11

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  /// 文件名称
  String pageName = T.toString();

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}

/// 基类 页面 State
abstract class BasePageState<T extends StatefulWidget> extends BaseState<T> {
  /// 页面标题
  @protected
  String title = '';

  @override
  void initState() {
    Log.d('===== Page $pageName ===== OPEN =====');

    super.initState();
  }

  @override
  void dispose() {
    Log.d('===== Page $pageName ===== CLOSE =====');

    super.dispose();
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter_widget/extension/extension.dart';

/// @Describe: 日志打印
///
/// @Author: LiWeNHuI
/// @Date: 2022/3/24

class Log {
  /// 日志打印
  static void d(dynamic text, {int? wrapWidth}) {
    if (!kReleaseMode) {
      debugPrint(text.toString(), wrapWidth: wrapWidth);
    }
  }

  /// 超长行折行后打印
  static void cusPrint(
    String text, {
    String prefix = '',
    int lengthLimit = 400,
  }) {
    if (text.isBlank) {
      d('$prefix: null');
      return;
    }

    if (text.length <= lengthLimit) {
      d('$prefix$text');
      return;
    }

    while (text.length >= lengthLimit) {
      d('$prefix${text.substring(0, lengthLimit)}');
      text = text.substring(lengthLimit, text.length);
      if (text.length <= lengthLimit) {
        d('$prefix$text');
      }
    }
  }
}

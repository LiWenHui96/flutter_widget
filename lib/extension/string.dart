/// @Describe: String 扩展函数
///
/// @Author: LiWeNHuI
/// @Date: 2022/3/24

extension ExtendString on String? {
  /// isBlank
  bool get isBlank {
    if (this == null) {
      return true;
    }

    if (this!.isEmpty || this!.replaceAll(' ', '').isEmpty) {
      return true;
    }

    return false;
  }

  /// isNotBlank
  bool get isNotBlank => !isBlank;

  /// 显示信息
  String get d => isBlank ? '' : this!;
}

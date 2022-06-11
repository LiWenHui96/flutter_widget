import 'package:flutter/material.dart';
import 'package:flutter_widget/config/config.dart';
import 'package:flutter_widget/utils/utils.dart';

/// @Describe:
///
/// @Author: LiWeNHuI
/// @Date: 2022/6/11

class AbsorbPointerPage extends StatefulWidget {
  /// 外部调用
  const AbsorbPointerPage({Key? key}) : super(key: key);

  @override
  State<AbsorbPointerPage> createState() => _AbsorbPointerPageState();
}

class _AbsorbPointerPageState extends BasePageState<AbsorbPointerPage> {
  bool _absorbing = false;

  String url =
      'https://api.flutter.dev/flutter/widgets/AbsorbPointer-class.html';

  @override
  Widget build(BuildContext context) {
    final Widget child = Column(
      children: <Widget>[
        Text('响应状态: ${_absorbing ? '无响应' : '有响应'}'),
        Switch(
          value: _absorbing,
          onChanged: (bool value) {
            removeSnackBar(context);
            setState(() => _absorbing = value);
          },
        ),
        const SizedBox(height: 20),
        AbsorbPointer(
          absorbing: _absorbing,
          child: GestureDetector(
            onTap: () => showSnackBar(context, '红色框点击了'),
            child: Container(width: 160, height: 160, color: Colors.blue),
          ),
        ),
        const Spacer(),
        const Text.rich(
          TextSpan(
            children: <InlineSpan>[
              TextSpan(text: 'AbsorbPointer 是可禁止用户 '),
              TextSpan(
                text: '输入/点击/手势',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: ' 的组件，'),
              TextSpan(text: '可以禁止多个组件，无须一个一个组件去处理。工作原理：接收点击事件后，消耗掉事件。'),
            ],
          ),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () async => toLaunchUrl(url),
          child: Text(
            url,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('AbsorbPointer')),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10)
            .add(EdgeInsets.only(bottom: bottomBarHeight)),
        child: child,
      ),
    );
  }
}

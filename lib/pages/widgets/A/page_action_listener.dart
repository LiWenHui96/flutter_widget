import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget/utils/utils.dart';

/// @Describe:
///
/// @Author: LiWeNHuI
/// @Date: 2022/6/11

class ActionListenerPage extends StatefulWidget {
  /// 外部调用
  const ActionListenerPage({Key? key}) : super(key: key);

  @override
  State<ActionListenerPage> createState() => _ActionListenerPageState();
}

class _ActionListenerPageState extends State<ActionListenerPage> {
  MyAction myAction = MyAction();

  bool openListener = false;

  String url =
      'https://api.flutter.dev/flutter/widgets/ActionListener-class.html';

  @override
  Widget build(BuildContext context) {
    final Widget child = Column(
      children: <Widget>[
        Text('状态: ${openListener ? '监听已挂载' : '监听已注销'}'),
        Switch(
          value: openListener,
          onChanged: (bool value) {
            removeSnackBar(context);
            setState(() => openListener = value);
          },
        ),
        if (openListener)
          ActionListener(
            listener: (Action<Intent> action) {
              if (action.intentType == MyIntent) {
                showSnackBar(context, '事件触发');
              }
            },
            action: myAction,
            child: ElevatedButton(
              onPressed: () => const ActionDispatcher()
                  .invokeAction(myAction, const MyIntent()),
              child: const Text('点击触发事件'),
            ),
          ),
        const SizedBox(height: 20),
        Text.rich(
          TextSpan(
            children: <InlineSpan>[
              const TextSpan(text: 'ActionListener 是一个 '),
              const TextSpan(
                text: '辅助的 Widget',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const TextSpan(text: '，配合 '),
              TextSpan(
                text: 'Action',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => toLaunchUrl(
                        'https://api.flutter.dev/flutter/widgets/Action-class.html',
                      ),
              ),
              const TextSpan(text: '、'),
              TextSpan(
                text: 'ActionDispatcher',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => toLaunchUrl(
                        'https://api.flutter.dev/flutter/widgets/ActionDispatcher-class.html',
                      ),
              ),
              const TextSpan(
                text: '、Intent，用于确保正确删除操作上的侦听器。（查看 Run 标签，存在日志信息）',
              ),
            ],
          ),
        ),
        launchUrlWidget(context, url),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('ActionListener')),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15)
            .add(EdgeInsets.only(bottom: bottomBarHeight)),
        child: child,
      ),
    );
  }
}

/// 自定义动作
class MyAction extends Action<MyIntent> {
  @override
  void addActionListener(ActionListenerCallback listener) {
    super.addActionListener(listener);
    Log.d('挂载上了动作');
  }

  @override
  void removeActionListener(ActionListenerCallback listener) {
    super.removeActionListener(listener);
    Log.d('注销了动作');
  }

  @override
  void invoke(covariant MyIntent intent) {
    notifyActionListeners();
  }
}

/// 自定义意图
class MyIntent extends Intent {
  // ignore: public_member_api_docs
  const MyIntent();
}

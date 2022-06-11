import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget/config/config.dart';
import 'package:flutter_widget/routes.dart';

/// @Describe:
///
/// @Author: LiWeNHuI
/// @Date: 2022/6/11

class MainPage extends StatefulWidget {
  /// 外部调用
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends BasePageState<MainPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> list = Routes.widgets.keys.toList();

    final Widget child = ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final ElevatedButton child = ElevatedButton(
          onPressed: () async => Navigator.pushNamed(context, list[index]),
          child: Text(list[index]),
        );

        return Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: child,
        );
      },
      itemCount: list.length,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Widget')),
      body: CupertinoScrollbar(child: child),
    );
  }
}

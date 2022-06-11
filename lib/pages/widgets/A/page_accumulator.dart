import 'package:flutter/material.dart';
import 'package:flutter_widget/utils/utils.dart';

/// @Describe: Accumulator
///
/// @Author: LiWeNHuI
/// @Date: 2022/6/11

class AccumulatorPage extends StatefulWidget {
  /// 外部调用
  const AccumulatorPage({Key? key}) : super(key: key);

  @override
  State<AccumulatorPage> createState() => _AccumulatorPageState();
}

class _AccumulatorPageState extends State<AccumulatorPage> {
  Accumulator accumulator = Accumulator();

  String url =
      'https://api.flutter.dev/flutter/painting/Accumulator-class.html';

  @override
  Widget build(BuildContext context) {
    final Widget child = Column(
      children: <Widget>[
        Text('累加器数量为：${accumulator.value}'),
        const SizedBox(height: 20),
        const Text.rich(
          TextSpan(
            children: <InlineSpan>[
              TextSpan(text: 'Accumulator 是一个 '),
              TextSpan(
                text: '累加器',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: '，它可以在一定程度上替换你的 i++ 操作。'),
            ],
          ),
        ),
        launchUrlWidget(context, url),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Accumulator')),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15)
            .add(EdgeInsets.only(bottom: bottomBarHeight)),
        child: child,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => accumulator.increment(1)),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ToolTipDemo extends StatelessWidget {
  const ToolTipDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ToolTips')),
      body: Center(
          child: Tooltip(
              message: 'hello',
              child: Image.network('https://picsum.photos/250?image=9'))),
    );
  }
}

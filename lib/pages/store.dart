import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: Text(title),
        ));
  }
}

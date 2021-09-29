import 'package:flutter/material.dart';

class SocialPage extends StatelessWidget {
  const SocialPage({Key? key, required this.title}) : super(key: key);

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

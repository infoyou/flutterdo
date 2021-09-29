import 'package:flutter/material.dart';

class EachPage extends StatefulWidget {
  const EachPage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _EachPageState createState() => _EachPageState();
}

class _EachPageState extends State<EachPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.grey,
          elevation: 4.0,
        ),
        body: Center(
          child: Text(widget.title, style: TextStyle(fontSize: 36.0)),
        ));
  }
}

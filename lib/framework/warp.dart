import 'dart:ui';

import 'package:flutter/material.dart';

class WarpDemo extends StatefulWidget {
  WarpDemo({Key? key}) : super(key: key);

  @override
  _WarpDemoState createState() => _WarpDemoState();
}

class _WarpDemoState extends State<WarpDemo> {
  List<Widget>? pictureList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pictureList = <Widget>[]..add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap流式布局'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height / 2,
            color: Colors.grey,
            child: Wrap(
              children: pictureList!,
              spacing: 26.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAddButton() {
    return GestureDetector(
        onTap: () {
          if (pictureList!.length < 9) {
            setState(() {
              pictureList!.insert(pictureList!.length - 1, buildPhoto());
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 80.0,
            height: 80.0,
            color: Colors.black54,
            child: Icon(Icons.add),
          ),
        ));
  }

  Widget buildPhoto() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.amber,
        child: Center(child: Text('照片')),
      ),
    );
  }
}

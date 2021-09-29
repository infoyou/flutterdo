import 'package:flutter/material.dart';
import 'tab_keeplive.dart';

class TabSlide extends StatefulWidget {
  const TabSlide({Key? key}) : super(key: key);

  @override
  _TabSlideState createState() => _TabSlideState();
}

class _TabSlideState extends State<TabSlide>
    with SingleTickerProviderStateMixin {
  // ？属性名称 可以为空
  TabController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose

    // 属性名称！非空判断
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tab Slide'),
          bottom: TabBar(
            controller: _controller,
            tabs: [
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.directions_boat)),
              Tab(icon: Icon(Icons.directions_car)),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: <Widget>[TabKeeplive(), TabKeeplive(), TabKeeplive()],
        ));
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'bottom_regular.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  Animation<double>? _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 5000))
          ..repeat(reverse: true);
    // _animation = Tween(begin: 0.0, end: 1.0).animate(_controller!);

    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeIn,
    );

    _animation!.addStatusListener((status) {
      print('addStatusListener start');

      print(status);

      if (status == AnimationStatus.reverse) {
        // 显示
        // if (status == AnimationStatus.forward) { // 显示 -> 渐隐

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNavi(title: '易楼经纪人')),
            (route) => false);
      }
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FadeTransition(
          opacity: _animation!,
          child: Image.network(
            'https://picsum.photos/250?image=9',
            scale: 0.8,
            fit: BoxFit.cover,
          )),

      // flutter icon
      // child: FadeTransition(
      //   opacity: _animation!,
      //   child:
      //       const Padding(padding: EdgeInsets.all(8), child: FlutterLogo()),
      // )),
    );
  }
}

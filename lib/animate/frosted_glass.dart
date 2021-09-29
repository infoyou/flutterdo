import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedClass extends StatelessWidget {
  const FrostedClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.network(
                'https://ke-image.ljcdn.com/hdic-resblock/48b5b2c8-7b26-4b23-bde3-641b876490d3.JPG'),
          ),
          Center(
            //可裁切的矩形
            child: ClipRect(
              //背景过滤器
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                child: Opacity(
                    opacity: 0.6, //模糊程度
                    child: Container(
                      width: 500.0,
                      height: 700.0,
                      //盒子修饰器
                      decoration: BoxDecoration(color: Colors.grey.shade200),
                      child: Center(
                        child: Text(
                          'Adam',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

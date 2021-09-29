import 'package:flutter/material.dart';

class CustomeRoute extends PageRouteBuilder {
  final Widget widget;

  CustomeRoute(this.widget)
      : super(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (
              BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
            ) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              int type = 4; // 动画风格
              switch (type) {
                case 0:
                  {
                    // 渐隐渐现
                    return FadeTransition(
                      opacity: Tween(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animation1, curve: Curves.fastOutSlowIn)),
                      child: child,
                    );
                  }

                case 1:
                  {
                    // 缩放
                    return ScaleTransition(
                      scale: Tween(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animation1, curve: Curves.fastOutSlowIn)),
                      child: child,
                    );
                  }

                case 2:
                  {
                    // 旋转
                    return RotationTransition(
                      turns: Tween(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animation1, curve: Curves.fastOutSlowIn)),
                      child: child,
                    );
                  }

                case 3:
                  {
                    // 旋转 + 缩放
                    return RotationTransition(
                        turns: Tween(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                                parent: animation1,
                                curve: Curves.fastOutSlowIn)),
                        child: ScaleTransition(
                          scale: Tween(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                  parent: animation1,
                                  curve: Curves.fastOutSlowIn)),
                          child: child,
                        ));
                  }

                case 4:
                  {
                    // 平移
                    return SlideTransition(
                      position: Tween<Offset>(
                              begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                          .animate(CurvedAnimation(
                              parent: animation1, curve: Curves.fastOutSlowIn)),
                      child: child,
                    );
                  }

                default:
                  {
                    // 渐隐渐现
                    return FadeTransition(
                      opacity: Tween(begin: 0.0, end: 2.0).animate(
                          CurvedAnimation(
                              parent: animation1, curve: Curves.fastOutSlowIn)),
                      child: child,
                    );
                  }
              }
            });
}

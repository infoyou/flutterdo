import '../framework/search_bar.dart';
import 'package:flutter/material.dart';
import 'framework/bottom_regular.dart';
import 'framework/bottom_irregular.dart';
import 'framework/tab_slide.dart';
import 'framework/search_bar.dart';
import 'framework/warp.dart';
import 'animate/expansion_title.dart';
import 'animate/expansion_panel.dart';
import 'animate/custom_clipper.dart';
import 'framework/splash_screen.dart';
import 'framework/right_back_demo.dart';
import 'framework/tool_tip.dart';
import 'framework/draggable_demo.dart';
import 'animate/item_list.dart';
import 'animate/frosted_glass.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      // 自定义主题样本
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // 规则 5个 Bottom
      // home: BottomNavi(title: '易楼经纪人'),

      // 不规则 5个 Bottom
      // home: BottomBarNavi(title: '易楼Boss端'),

      // 毛玻璃效果
      home: Scaffold(
        body: FrostedClass(),
      ),

      // tab slide
      // home: TabSlide(),

      // search
      // home: SearchBar(),

      // WarpDemo
      // home: WarpDemo(),

      // ExpansionTitle
      // home: ExpansionTitleDemo(),

      // ExpansionPanelDemo
      // home: ExpansionPanelDemo(),

      // ItemListDemo
      // home: ItemListDemo(),

      // CustomClipperDemo
      // home: CustomClipperDemo(),

      // SplashScreen
      // home: SplashScreen(),

      // RightBackDemo
      // home: RightBackDemo(),

      // ToolTip
      // home: ToolTipDemo(),

      // DraggableDemo
      // home: DraggableDemo(),
    );
  }
}

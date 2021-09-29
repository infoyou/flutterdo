import 'package:flutter/material.dart';
import '../pages/each.dart';
import '../animate/swift_page.dart';

class BottomBarNavi extends StatefulWidget {
  const BottomBarNavi({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _BottomBarNaviState createState() => _BottomBarNaviState();
}

class _BottomBarNaviState extends State<BottomBarNavi> {
  int _selectedIndex = 0;
  List<Widget> pageList = [];

  void initState() {
    pageList
      ..add(EachPage(title: "首页"))
      ..add(EachPage(title: "店铺"))
      ..add(EachPage(title: "来客宝"))
      ..add(EachPage(title: "经纪圈"))
      ..add(EachPage(title: "我的"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_selectedIndex],
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return FirstPage(title: "First");
            }));
          },
          tooltip: 'Adam',
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              icon: Icon(Icons.home),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              icon: Icon(Icons.store),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
                });
              },
              icon: Icon(Icons.social_distance_rounded),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 4;
                });
              },
              icon: Icon(Icons.person),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

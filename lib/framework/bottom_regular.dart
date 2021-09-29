import '../pages/store.dart';
import 'package:flutter/material.dart';
import '../pages/home.dart';
import '../pages/store.dart';
import '../pages/report.dart';
import '../pages/social.dart';
import '../pages/me.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BottomNavi extends StatefulWidget {
  const BottomNavi({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _BottomNaviState createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  final _BottomNavigationColor = Colors.blue;

  int _selectedIndex = 0;
  List<Widget> pageList = [];

  void getMethod() async {
    var url = Uri.parse('https://jd.itying.com/api/httpGet');
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse);

      var msg = jsonResponse['msg'];
      print('http msg: $msg.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void postMethod() async {
    var url = Uri.parse('https://jd.itying.com/api/httpPost');
    // Await the http get response, then decode the json-formatted response.
    var response =
        await http.post(url, body: {"userName": "Adam", "role": "3"});
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse);

      var msg = jsonResponse['msg'];
      print('http msg: $msg.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void initState() {
    pageList
      ..add(HomePage(title: "首页"))
      ..add(StorePage(title: "店铺"))
      ..add(ReportPage(title: "来客宝"))
      ..add(SocialPage(title: "经纪圈"))
      ..add(MePage(title: "我的"));

    // Map -> String
    print('Map -> String');
    Map userInfoMap = {"userName": "Adam", "role": "3"};

    var jsonStr = convert.jsonEncode(userInfoMap); // Map -> json String
    print(jsonStr);

    print(jsonStr is String);

    //  String -> Map
    print('String -> Map');
    String userInfo = '{"userName": "Adam", "role": "3"}';

    var userMap = convert.jsonDecode(userInfo); // Map -> json String
    print(userMap);

    print(userMap is Map);
    print("userName: " + userMap["userName"]); // json String  -> Map
    print("role: " + userMap["role"]);

    postMethod();

    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _BottomNavigationColor,
            ),
            label: "Home",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.store,
              color: _BottomNavigationColor,
            ),
            label: "Store",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.format_align_center,
              color: _BottomNavigationColor,
            ),
            label: "Report",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.social_distance_rounded,
              color: _BottomNavigationColor,
            ),
            label: "Social",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _BottomNavigationColor,
            ),
            label: "Me",
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      // body: Center(
      //   // Center is a layout widget. It takes a single child and positions it
      //   // in the middle of the parent.
      //   child: Column(
      //     // Column is also a layout widget. It takes a list of children and
      //     // arranges them vertically. By default, it sizes itself to fit its
      //     // children horizontally, and tries to be as tall as its parent.
      //     //
      //     // Invoke "debug painting" (press "p" in the console, choose the
      //     // "Toggle Debug Paint" action from the Flutter Inspector in Android
      //     // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      //     // to see the wireframe for each widget.
      //     //
      //     // Column has various properties to control how it sizes itself and
      //     // how it positions its children. Here we use mainAxisAlignment to
      //     // center the children vertically; the main axis here is the vertical
      //     // axis because Columns are vertical (the cross axis would be
      //     // horizontal).
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

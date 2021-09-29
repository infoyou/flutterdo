import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:fluttertoast/fluttertoast.dart';

class ItemListDemo extends StatefulWidget {
  const ItemListDemo({Key? key}) : super(key: key);

  @override
  _ItemListDemoState createState() => _ItemListDemoState();
}

class _ItemListDemoState extends State<ItemListDemo> {
  List<Map>? mList;

  void getMethod() async {
    print("===========> getMethod");
    var url = Uri.parse('https://jd.itying.com/api/pcate');
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var dataMap = convert.jsonDecode(response.body);

      print('http msg: $dataMap.');

      print("coustom data");
      mList = <Map>[];

      setState(() {
        for (var item in dataMap['result']) {
          print(item);
          mList!.add(item);
        }
        // mList = dataMap['result'];
        print(mList is List);
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    print("===========> initState");
    // TODO: implement initState
    super.initState();

    getMethod();
  }

  @override
  Widget build(BuildContext context) {
    print("===========> build");
    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
      ),
      body: this.mList!.length > 0
          ? ListView.builder(
              itemCount: this.mList!.length,
              itemBuilder: _getListItemTile,
            )
          : Text("暂无数据"),
    );
  }

  Widget _getListItemTile(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        print(this.mList![index]["title"]);

        Fluttertoast.showToast(
            msg: this.mList![index]["title"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);

        // if (this.mList!.any((item) => item.isSelected)) {
        //   setState(() {
        //     this.mList![index].isSelected = !this.mList![index].isSelected;
        //   });
        // }
      },
      // onLongPress: () {
      //   setState(() {
      //     mList![index].isSelected = true;
      //   });
      // },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        // color: mList![index].isSelected ? Colors.red[100] : Colors.white,
        child: ListTile(
          title: Text(this.mList![index]["title"]),
        ),
      ),
    );
  }
}

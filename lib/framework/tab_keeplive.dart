import 'package:flutter/material.dart';

class TabKeeplive extends StatefulWidget {
  const TabKeeplive({Key? key}) : super(key: key);

  @override
  _TabKeepliveState createState() => _TabKeepliveState();
}

class _TabKeepliveState extends State<TabKeeplive>
    with AutomaticKeepAliveClientMixin {
  int _counter = 0;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('add one with click one'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.bodyText1,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increament',
        child: Icon(Icons.add),
      ),
    );
  }
}

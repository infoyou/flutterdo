import 'package:flutter/material.dart';

class ExpansionTitleDemo extends StatelessWidget {
  const ExpansionTitleDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansion Title'),
      ),
      body: Center(
        child: ExpansionTile(
          title: Text('Expansion Title'),
          leading: Icon(Icons.ac_unit),
          backgroundColor: Colors.grey,
          children: <Widget>[
            ListTile(
              title: Text('list title'),
              subtitle: Text('subTitle'),
            )
          ],
          //  默认打开
          initiallyExpanded: true,
        ),
      ),
    );
  }
}

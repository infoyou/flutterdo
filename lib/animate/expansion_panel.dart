import 'package:flutter/material.dart';

class ExpansionPanelDemo extends StatefulWidget {
  const ExpansionPanelDemo({Key? key}) : super(key: key);

  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<int>? mList;
  List<ExpandStateBean>? expandStateList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mList = <int>[];
    expandStateList = <ExpandStateBean>[];

    for (int i = 0; i < 10; i++) {
      mList!.add(i);
      expandStateList!.add(ExpandStateBean(i, false));
    }
  }

  _setCurrentIndex(int index, isExpand) {
    setState(() {
      expandStateList!.forEach((item) {
        if (item.index == index) {
          item.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansion Panel'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, bol) {
            _setCurrentIndex(index, bol);
          },
          children: mList!.map((index) {
            return ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text('Title no.$index'),
                );
              },
              body: ListTile(
                title: Text('Expansion no.$index'),
              ),
              isExpanded: expandStateList![index].isOpen,
            );
          }).toList(),
        ),
      ),
    );
  }
}

// 开合状态
class ExpandStateBean {
  var isOpen;
  var index;

  ExpandStateBean(this.index, this.isOpen);
}

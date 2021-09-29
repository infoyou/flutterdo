import 'package:flutter/material.dart';
import 'draggable_widget.dart';

class DraggableDemo extends StatefulWidget {
  const DraggableDemo({Key? key}) : super(key: key);

  @override
  _DraggableDemoState createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  Color _draggleColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DraggableWidget(offset: Offset(80, 80), widgetColor: Colors.blue),
          DraggableWidget(offset: Offset(180, 80), widgetColor: Colors.purple),
          Center(
            child: DragTarget(
              onAccept: (Color color) {
                _draggleColor = color;
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 200,
                  height: 200,
                  color: _draggleColor,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

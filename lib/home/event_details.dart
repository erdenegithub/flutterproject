import 'package:flutter/material.dart';
import 'package:flutterproject/client/items/event_item.dart';

class EventDetails extends StatelessWidget {
  final EventItem eventItem;
  EventDetails({@required this.eventItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Container(
        height: 20,
        width: 20,
        color: Colors.amber,
      ),
    );
  }
}

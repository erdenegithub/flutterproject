import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/bloc/firebase_controller.dart';
import 'package:flutterproject/client/home_client.dart';
import 'package:flutterproject/client/items/lesson_item.dart';
import 'package:flutterproject/home/cells/event_detail.dart';

class EventSchedule extends StatefulWidget {
  final int dayNum = HomeClient().eventsDayNum;

  @override
  _EventScheduleState createState() => _EventScheduleState();
}

class _EventScheduleState extends State<EventSchedule> {
  final client = HomeClient();

  void eventPressed(int index) async {
    bool flag = false;
    final QuerySnapshot snapshot =
        await usersRef.where('email', isEqualTo: HomeClient().username).get();
    if (snapshot.docs.isNotEmpty == true) {
      List<dynamic> choosenLessons = snapshot.docs[0].data()['choosenLessons'];

      for (var singleLesson in choosenLessons) {
        final DocumentSnapshot doc = await lessonsRef.doc(singleLesson).get();
        if (doc['weekDay'] == client.eventsDayNum.toString() &&
            doc['startTime'] ==
                client.allEvents[client.eventsDayNum][index].startTime) {
          flag = true;
          break;
        }
      }
    }

    if (flag == true) {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: Text('Excuse me'),
              content: Text('You have a scheduled lesson at this hour'),
              actions: [
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok'),
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: Text('Hello'),
              content: Text('Do you want to book this event ?'),
              actions: [
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () async {
                    final QuerySnapshot snapshot = await usersRef
                        .where('email', isEqualTo: HomeClient().username)
                        .get();
                    await usersRef.doc(snapshot.docs[0].id).update({
                      'choosenEvents': FieldValue.arrayUnion(
                          [client.allEvents[client.eventsDayNum][index].id])
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Book'),
                ),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Back'),
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (client.allEvents[widget.dayNum].length == 0)
              Text(
                'Currently we have no events on this day',
                style: Theme.of(context).textTheme.headline1,
              )
            else
              for (int i = 0; i < client.allEvents[widget.dayNum].length; i++)
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: EventDetail(
                    eventItem: client.allEvents[widget.dayNum][i],
                    onPressed: eventPressed,
                    eventIndex: i,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

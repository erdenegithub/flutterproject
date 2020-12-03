import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/bloc/firebase_controller.dart';
import 'package:flutterproject/client/home_client.dart';
import 'package:flutterproject/client/items/lesson_item.dart';
import 'package:flutterproject/home/cells/lesson_detail.dart';

class MLessonsBottomSheet extends StatefulWidget {
  final List<LessonItem> lessons;

  MLessonsBottomSheet({@required this.lessons});

  @override
  _MLessonsBottomSheetState createState() => _MLessonsBottomSheetState();
}

class _MLessonsBottomSheetState extends State<MLessonsBottomSheet> {
  void onPressed(int id) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Hello'),
            content: Text('Do you want to choose this lesson ?'),
            actions: [
              RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  final QuerySnapshot snapshot = await usersRef
                      .where('email', isEqualTo: HomeClient().username)
                      .get();
                  await usersRef.doc(snapshot.docs[0].id).update({
                    'choosenLessons':
                        FieldValue.arrayUnion([widget.lessons[id].id])
                  });
                  Navigator.of(context).pop();
                },
                child: Text('Choose'),
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

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height - 100;
    double cellHeight = 200 * widget.lessons.length.toDouble() +
        45 +
        MediaQuery.of(context).padding.bottom;
    double height = screenHeight >= cellHeight ? cellHeight : screenHeight;
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 30),
      height: height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < widget.lessons.length; i++)
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: LessonDetail(
                  lessonItem: widget.lessons[i],
                  onPressed: onPressed,
                  lessonIndex: i,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

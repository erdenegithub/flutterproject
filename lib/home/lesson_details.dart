import 'package:flutter/material.dart';
import 'package:flutterproject/client/items/lesson_item.dart';

class LessonDetails extends StatelessWidget {
  static const routeName = 'LessonDetails';

  final LessonItem lessonItem;
  LessonDetails({@required this.lessonItem});

  @override
  Widget build(BuildContext context) {
    print(lessonItem.duration);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lesson Details'),
      ),
      body: Container(),
    );
  }
}

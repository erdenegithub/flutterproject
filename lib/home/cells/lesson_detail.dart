import 'package:flutter/material.dart';
import 'package:flutterproject/client/items/lesson_item.dart';

class LessonDetail extends StatelessWidget {
  final LessonItem lessonItem;
  final Function onPressed;
  final int lessonIndex;
  LessonDetail(
      {@required this.lessonItem,
      @required this.onPressed,
      @required this.lessonIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lessonItem.startTime,
                style: TextStyle(
                  fontFamily: 'Rubik-Medium',
                  color: Colors.grey[700],
                ),
              ),
              Text(
                lessonItem.duration,
                style: TextStyle(
                  fontFamily: 'Rubik-Medium',
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              onPressed(lessonIndex);
            },
            child: Container(
              height: 165,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1,
                  color: Colors.grey[300],
                ),
              ),
              padding: EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lessonItem.title,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(lessonItem.subTitle),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.account_circle),
                      SizedBox(width: 10),
                      Text(lessonItem.teacherName)
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 35),
                      Text(lessonItem.teacherNumber),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 10),
                      Text(lessonItem.lessonLocation)
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 35),
                      Text(lessonItem.lessonFloor),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

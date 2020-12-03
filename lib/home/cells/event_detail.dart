import 'package:flutter/material.dart';
import 'package:flutterproject/client/items/lesson_item.dart';

class EventDetail extends StatelessWidget {
  final LessonItem eventItem;
  final Function onPressed;
  final int eventIndex;

  EventDetail(
      {@required this.eventItem,
      @required this.onPressed,
      @required this.eventIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                eventItem.startTime,
                style: TextStyle(
                  fontFamily: 'Rubik-Medium',
                  color: Colors.grey[700],
                ),
              ),
              Text(
                eventItem.duration,
                style: TextStyle(
                  fontFamily: 'Rubik-Medium',
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              onPressed(eventIndex);
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
                    eventItem.title,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(eventItem.subTitle),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.account_circle),
                      SizedBox(width: 10),
                      Text(eventItem.teacherName)
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 10),
                      Text(eventItem.lessonLocation)
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

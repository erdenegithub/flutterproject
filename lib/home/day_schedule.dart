import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/bloc/firebase_controller.dart';
import 'package:flutterproject/client/home_client.dart';
import 'package:flutterproject/client/items/lesson_item.dart';
import 'package:flutterproject/components/custom_round_button.dart';
import 'package:flutterproject/components/m_lessons_bottom_sheet.dart';
import 'package:flutterproject/home/cells/lesson_detail.dart';
import 'package:flutterproject/home/lesson_details.dart';

class DaySchedule extends StatefulWidget {
  final int dayNum = HomeClient().lessonsDayNum;

  @override
  _DayScheduleState createState() => _DayScheduleState();
}

class _DayScheduleState extends State<DaySchedule> {
  final List<List<LessonItem>> lessons = [];
  final client = HomeClient();

  getLessons() async {
    final QuerySnapshot snapshot =
        await usersRef.where('email', isEqualTo: HomeClient().username).get();
    if (snapshot.docs.isNotEmpty == true) {
      List<dynamic> choosenLessons = snapshot.docs[0].data()['choosenLessons'];

      for (int i = 0; i < 7; i++) {
        List<LessonItem> temp = [];
        for (var singleLesson in choosenLessons) {
          final DocumentSnapshot doc = await lessonsRef.doc(singleLesson).get();
          if (doc['weekDay'] == i.toString()) {
            final lessonTemp = LessonItem(
                doc.id,
                doc['startTime'],
                doc['duration'],
                doc['title'],
                doc['subTitle'],
                doc['teacherName'],
                doc['teacherNumber'],
                doc['lessonLocation'],
                doc['lessonFloor']);
            temp.add(lessonTemp);
          }
        }
        setState(() {
          lessons.add(temp);
        });
      }
    }
  }

  @override
  void initState() {
    getLessons();
    super.initState();
  }

  void lessonPressed(int lessonIndex) {
    // Navigator.pushNamed(context, LessonDetails.routeName,
    //     arguments: lessons[widget.dayNum][lessonIndex]);
  }

  bottomButtonClicked() {
    print('homeclient ' + HomeClient().allLessons.length.toString());

    showModalBottomSheet(
      context: context,
      builder: (context) => MLessonsBottomSheet(
        lessons: client.allLessons[client.lessonsDayNum],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (lessons.length == 7)
              if (lessons[widget.dayNum].length == 0)
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    'No lessons',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                )
              else
                for (int i = 0; i < lessons[widget.dayNum].length; i++)
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: LessonDetail(
                      lessonItem: lessons[widget.dayNum][i],
                      onPressed: lessonPressed,
                      lessonIndex: i,
                    ),
                  ),
            MRoundButton(
                buttonTitle: 'Add lesson',
                onPressed: bottomButtonClicked,
                colorful: true,
                enabled: true),
          ],
        ),
      ),
    );
  }
}

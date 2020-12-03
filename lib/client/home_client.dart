import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterproject/bloc/firebase_controller.dart';
import 'package:flutterproject/client/items/lesson_item.dart';

class HomeClient {
  static final HomeClient _singleton = HomeClient._internal();

  factory HomeClient() {
    return _singleton;
  }

  HomeClient._internal();

  var username = '';
  int lessonsDayNum = 0;
  int eventsDayNum = 0;
  List<List<LessonItem>> allLessons = [];
  List<List<LessonItem>> allEvents = [];

  getAllLessons() async {
    final QuerySnapshot snapshot = await lessonsRef.get();
    for (int i = 0; i < 7; i++) {
      List<LessonItem> temp = [];
      for (var element in snapshot.docs) {
        if (element.data()['weekDay'] == i.toString()) {
          final lessonTemp = LessonItem(
            element.id,
            element.data()['startTime'],
            element.data()['duration'],
            element.data()['title'],
            element.data()['subTitle'],
            element.data()['teacherName'],
            element.data()['teacherNumber'],
            element.data()['lessonLocation'],
            element.data()['lessonFloor'],
          );
          temp.add(lessonTemp);
        }
      }
      allLessons.add(temp);
    }
  }

  getAllEvents() async {
    final QuerySnapshot snapshot = await eventRef.get();
    for (int i = 0; i < 7; i++) {
      List<LessonItem> temp = [];
      for (var element in snapshot.docs) {
        if (element.data()['weekDay'] == i.toString()) {
          final lessonTemp = LessonItem(
            element.id,
            element.data()['startTime'],
            element.data()['duration'],
            element.data()['title'],
            element.data()['subTitle'],
            element.data()['teacherName'],
            element.data()['teacherNumber'],
            element.data()['lessonLocation'],
            element.data()['lessonFloor'],
          );
          temp.add(lessonTemp);
        }
      }
      allEvents.add(temp);
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/bloc/firebase_controller.dart';
import 'package:flutterproject/bloc/login_bloc.dart';
import 'package:flutterproject/client/home_client.dart';
import 'package:flutterproject/client/items/lesson_item.dart';
import 'package:flutterproject/components/custom_round_button.dart';
import 'package:flutterproject/home/cells/lesson_detail.dart';
import 'package:flutterproject/login.dart';

class ProfileSettings extends StatefulWidget {
  static const routeName = 'ProfileSettings';

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  List<LessonItem> events = [];

  getEvents() async {
    final QuerySnapshot snapshot =
        await usersRef.where('email', isEqualTo: HomeClient().username).get();
    if (snapshot.docs.isNotEmpty == true) {
      List<dynamic> choosenEvents = snapshot.docs[0].data()['choosenEvents'];
      print(choosenEvents.length);
      for (var singleLesson in choosenEvents) {
        final DocumentSnapshot doc = await eventRef.doc(singleLesson).get();
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
        setState(() {
          events.add(lessonTemp);
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getEvents();
    print('events size ' + events.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Booked events',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(height: 10),
                  if (events.length == 0)
                    Padding(
                      padding: EdgeInsets.only(bottom: 100),
                      child: Text(
                        'you dont have any events',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    )
                  else
                    for (int i = 0; i < events.length; i++)
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: LessonDetail(
                          lessonItem: events[i],
                          onPressed: () {},
                          lessonIndex: i,
                        ),
                      ),
                ],
              ),
              MRoundButton(
                  buttonTitle: 'Log Out',
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => Login(bloc: LoginBloc())),
                        (Route<dynamic> route) => false);
                  },
                  colorful: true,
                  enabled: true),
            ],
          ),
        ),
      ),
    );
  }
}

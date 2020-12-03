import 'package:flutter/material.dart';
import 'package:flutterproject/client/home_client.dart';
import 'package:flutterproject/home/day_schedule.dart';
import 'package:flutterproject/home/tiles/timetable_tile.dart';
import 'package:rxdart/subjects.dart';

class TimetablePage extends StatefulWidget {
  @override
  _TimetablePageState createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  final controller = BehaviorSubject<bool>();

  @override
  void initState() {
    HomeClient().lessonsDayNum = 6;
    print('username ' + HomeClient().username);
    super.initState();
  }

  List<String> dayTitle = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  int selectedIndex = 0;
  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    int monthNum = DateTime.now().month - 1;
    int year = DateTime.now().year;

    return Stack(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 35, left: 20),
              child: Icon(
                Icons.calendar_today,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 35, left: 10),
              child: Text(
                '${months[monthNum]} ${year}',
                style: TextStyle(fontFamily: 'Rubik-Medium', fontSize: 30),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 100),
          child: Container(
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 5, right: 5, top: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < 7; i++)
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = i;
                              HomeClient().lessonsDayNum = (i + 6) % 7;
                              controller.add(true);
                            });
                          },
                          child: TimetableTile(
                              title: dayTitle[i],
                              isSelected: i == selectedIndex),
                        )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                StreamBuilder<bool>(
                    initialData: false,
                    stream: controller.stream,
                    builder: (context, snapshot) {
                      print('aaaaa');
                      return Expanded(
                        child: DaySchedule(),
                      );
                    })
              ],
            ),
          ),
        ),
      ],
    );
  }
}

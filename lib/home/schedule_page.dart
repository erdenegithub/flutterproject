import 'package:flutter/material.dart';
import 'package:flutterproject/client/home_client.dart';
import 'package:flutterproject/home/event_schedule.dart';
import 'package:flutterproject/home/tiles/timetable_tile.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  List<String> dayTitle = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(top: 35, left: 30),
              child: Text(
                'School events',
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
                              HomeClient().eventsDayNum = (i + 6) % 7;
                              selectedIndex = i;
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
                Expanded(child: EventSchedule())
              ],
            ),
          ),
        ),
      ],
    );
  }
}

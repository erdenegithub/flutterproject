import 'package:flutter/material.dart';

class FriendDetailCell extends StatelessWidget {
  final String title;
  FriendDetailCell({@required this.title});

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Text(
          title,
          style: TextStyle(
              fontFamily: 'Rubik-Medium',
              fontSize: 20,
              color: Color.fromRGBO(84, 91, 101, 1)),
        ),
      ),
    );
  }
}

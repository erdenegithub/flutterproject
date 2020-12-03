import 'package:flutter/material.dart';

class FriendsTile extends StatelessWidget {
  final int index;
  final String user;
  final Function onPressed;
  FriendsTile({
    @required this.index,
    @required this.user,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: InkWell(
        onTap: () => onPressed(index),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor),
          height: 60,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 25),
                child: Icon(Icons.accessibility),
              ),
              Container(
                padding: EdgeInsets.only(left: 25),
                child: Text(user),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

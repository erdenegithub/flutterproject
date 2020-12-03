import 'package:flutter/material.dart';
import 'package:flutterproject/client/items/user.dart';
import 'package:flutterproject/home/cells/friend_detail_cell.dart';

class FriendsDetail extends StatelessWidget {
  static const routeName = 'FriendsDetail';
  final MUser userData;

  FriendsDetail({@required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Table(
              children: [
                TableRow(children: [
                  FriendDetailCell(title: 'First Name : '),
                  FriendDetailCell(title: userData.firstName),
                ]),
                TableRow(children: [
                  FriendDetailCell(title: 'Last Name : '),
                  FriendDetailCell(title: userData.lastName),
                ]),
                TableRow(children: [
                  FriendDetailCell(title: 'Course : '),
                  FriendDetailCell(title: userData.course.toString()),
                ]),
                TableRow(children: [
                  FriendDetailCell(title: 'Email : '),
                  FriendDetailCell(title: userData.email),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

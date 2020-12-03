import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/bloc/firebase_controller.dart';
import 'package:flutterproject/client/items/user.dart';
import 'package:flutterproject/home/friends_detail.dart';
import 'package:flutterproject/home/profile_settings.dart';
import 'package:flutterproject/home/tiles/friends_tile.dart';
import 'package:rxdart/subjects.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  List<MUser> friendsNames = [];

  final controller = BehaviorSubject<bool>();

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  dispose() {
    controller.close();
    super.dispose();
  }

  getUsers() async {
    final QuerySnapshot snapshot = await usersRef.get();
    for (var element in snapshot.docs) {
      friendsNames.add(MUser(
          firstName: element.data()['firstname'],
          lastName: element.data()['lastname'],
          email: element.data()['email'],
          course: element.data()['course'].toString()));
    }
    controller.add(true);
  }

  void onPressed(int index) {
    print(friendsNames[index]);
    Navigator.pushNamed(context, FriendsDetail.routeName,
        arguments: friendsNames[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {
            Navigator.pushNamed(context, ProfileSettings.routeName);
          },
        ),
        title: Text('Friends'),
        shadowColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<bool>(
            initialData: false,
            stream: controller.stream,
            builder: (context, snapshot) {
              return Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return FriendsTile(
                      index: index,
                      user: friendsNames[index].firstName,
                      onPressed: onPressed,
                    );
                  },
                  itemCount: friendsNames.length,
                ),
              );
            }),
      ),
    );
  }
}

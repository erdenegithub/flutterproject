import 'package:flutter/material.dart';
import 'package:flutterproject/client/items/lesson_item.dart';
import 'package:flutterproject/home/friends_detail.dart';
import 'package:flutterproject/home/home_page.dart';
import 'package:flutterproject/home/lesson_details.dart';
import 'package:flutterproject/home/profile_settings.dart';
import 'package:flutterproject/routes/abstract/main_route.dart';

class HomeRoute extends MainRoute {
  @override
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        var screen = HomePage();
        return MaterialPageRoute(builder: (context) => screen);
      case ProfileSettings.routeName:
        var screen = ProfileSettings();
        return MaterialPageRoute(builder: (context) => screen);
      case FriendsDetail.routeName:
        final userData = settings.arguments;
        var screen = FriendsDetail(userData: userData);
        return MaterialPageRoute(builder: (context) => screen);
      case LessonDetails.routeName:
        final item = settings.arguments;
        var screen = LessonDetails(lessonItem: item);
        return MaterialPageRoute(builder: (context) => screen);
    }
  }
}

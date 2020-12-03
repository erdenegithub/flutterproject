import 'package:flutter/material.dart';
import 'package:flutterproject/bloc/register_course_bloc.dart';
import 'package:flutterproject/bloc/register_email_bloc.dart';
import 'package:flutterproject/bloc/register_name_bloc.dart';
import 'package:flutterproject/bloc/register_password_bloc.dart';
import 'package:flutterproject/onboard/register_course.dart';
import 'package:flutterproject/onboard/register_email.dart';
import 'package:flutterproject/onboard/register_name.dart';
import 'package:flutterproject/onboard/register_password.dart';
import 'package:flutterproject/onboard/register_success.dart';
import 'abstract/main_route.dart';

class OnboardRoute extends MainRoute {
  @override
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RegisterEmail.routeName:
        var bloc = RegisterEmailBloc();
        var screen = RegisterEmail(bloc: bloc);
        return MaterialPageRoute(builder: (context) => screen);
      case RegisterCourse.routeName:
        var bloc = RegisterCourseBloc();
        var screen = RegisterCourse(bloc: bloc);
        return MaterialPageRoute(builder: (context) => screen);
      case RegisterName.routeName:
        var bloc = RegisterNameBloc();
        var screen = RegisterName(bloc: bloc);
        return MaterialPageRoute(builder: (context) => screen);
      case RegisterPassword.routeName:
        var bloc = RegisterPasswordBloc();
        var screen = RegisterPassword(bloc: bloc);
        return MaterialPageRoute(builder: (context) => screen);
      case RegisterSuccess.routeName:
        var screen = RegisterSuccess();
        return MaterialPageRoute(builder: (context) => screen);
    }
  }
}

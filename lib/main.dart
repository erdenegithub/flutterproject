import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterproject/bloc/login_bloc.dart';
import 'package:flutterproject/login.dart';
import 'package:flutterproject/routes/abstract/generate_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(35),
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          color: Color(0xffA8C7BE),
        ),
        primaryColor: Color(0xffA8C7BE),
        fontFamily: 'Rubik-Regular',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 20,
            fontFamily: 'Rubik-Medium',
            color: Color.fromRGBO(84, 91, 101, 1),
            height: 1.5,
          ),
          bodyText1: TextStyle(
              fontSize: 13, fontFamily: 'Rubik-Regular', color: Colors.grey),
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonColor: Colors.amber,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.amber,
          disabledColor: Colors.red,
        ),
      ),
      onGenerateRoute: GenerateRoute().generateRoute,
      home: Login(bloc: LoginBloc()),
    );
  }
}

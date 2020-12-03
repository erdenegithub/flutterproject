import 'package:flutter/material.dart';
import 'package:flutterproject/bloc/login_bloc.dart';
import 'package:flutterproject/components/custom_round_button.dart';
import 'package:flutterproject/login.dart';

class RegisterSuccess extends StatelessWidget {
  static const routeName = 'RegisterSuccess';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text('success'),
                ),
              ),
              MRoundButton(
                  buttonTitle: 'Done',
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => Login(bloc: LoginBloc())),
                        (Route<dynamic> route) => false);
                  },
                  colorful: true,
                  enabled: true)
            ],
          ),
        ),
      ),
    );
  }
}

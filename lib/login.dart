import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterproject/bloc/login_bloc.dart';
import 'package:flutterproject/client/home_client.dart';
import 'package:flutterproject/components/custom_round_button.dart';
import 'package:flutterproject/components/m_textfield.dart';
import 'package:flutterproject/home/home_page.dart';
import 'package:flutterproject/onboard/register_email.dart';

class Login extends StatefulWidget {
  final LoginBloc bloc;
  Login({@required this.bloc});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  StreamSubscription successStream, errorStream;
  @override
  void initState() {
    super.initState();

    successStream = widget.bloc.successSubject.stream.listen((value) {
      if (value) {
        HomeClient().username = widget.bloc.usernameString;
        Navigator.pushNamed(context, HomePage.routeName);
      }
    });

    errorStream = widget.bloc.errorSubject.stream.listen((value) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(value),
              ));
    });
  }

  @override
  void dispose() {
    successStream.cancel();
    errorStream.cancel();
    super.dispose();
  }

  void buttonAction() {
    print('ButtonAction');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StreamBuilder<void>(
                      stream: widget.bloc.usernameStream,
                      builder: (context, snapshot) {
                        return MTextField(
                          placeholder: 'Email',
                          type: MTextFieldType.email,
                          isValid: false,
                          onChanged: (text) {
                            widget.bloc.usernameSubject.add(text);
                          },
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: StreamBuilder<void>(
                        stream: widget.bloc.passwordStream,
                        builder: (context, snapshot) {
                          return MTextField(
                            placeholder: 'Password',
                            type: MTextFieldType.password,
                            isValid: false,
                            onChanged: (text) {
                              widget.bloc.passwordSubject.add(text);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder<bool>(
                initialData: false,
                stream: widget.bloc.loginButtonStream,
                builder: (context, snapshot) {
                  return MRoundButton(
                    buttonTitle: 'Login',
                    onPressed: widget.bloc.checkCredentials,
                    colorful: snapshot.data,
                    enabled: snapshot.data,
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              MRoundButton(
                buttonTitle: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, RegisterEmail.routeName);
                },
                colorful: true,
                enabled: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

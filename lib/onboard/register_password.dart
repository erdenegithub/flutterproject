import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterproject/bloc/register_password_bloc.dart';
import 'package:flutterproject/components/custom_round_button.dart';
import 'package:flutterproject/components/m_textfield.dart';
import 'package:flutterproject/onboard/register_success.dart';

class RegisterPassword extends StatefulWidget {
  static const routeName = 'RegisterPassword';

  final RegisterPasswordBloc bloc;
  RegisterPassword({@required this.bloc});

  @override
  _RegisterPasswordState createState() => _RegisterPasswordState();
}

class _RegisterPasswordState extends State<RegisterPassword> {
  StreamSubscription nextScreenListener;

  @override
  void initState() {
    super.initState();

    nextScreenListener = widget.bloc.nextSubject.listen((value) {
      if (value == true) {
        Navigator.pushNamed(context, RegisterSuccess.routeName);
      }
    });
  }

  @override
  void dispose() {
    nextScreenListener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter password',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: StreamBuilder<void>(
                        stream: widget.bloc.password1Validation,
                        builder: (context, snapshot) {
                          return MTextField(
                            placeholder: 'Password',
                            type: MTextFieldType.password,
                            isValid: false,
                            onChanged: (text) {
                              widget.bloc.password1Subject.add(text);
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: StreamBuilder<void>(
                        stream: widget.bloc.password2Validation,
                        builder: (context, snapshot) {
                          return MTextField(
                            placeholder: 'Repeat password',
                            type: MTextFieldType.password,
                            isValid: false,
                            onChanged: (text) {
                              widget.bloc.password2Subject.add(text);
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              StreamBuilder<bool>(
                initialData: false,
                stream: widget.bloc.buttonValidation,
                builder: (context, snapshot) {
                  return MRoundButton(
                      buttonTitle: 'Continue',
                      onPressed: () {
                        widget.bloc.createUser();
                      },
                      colorful: snapshot.data,
                      enabled: snapshot.data);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

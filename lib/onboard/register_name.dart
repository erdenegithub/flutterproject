import 'package:flutter/material.dart';
import 'package:flutterproject/bloc/register_name_bloc.dart';
import 'package:flutterproject/components/custom_round_button.dart';
import 'package:flutterproject/components/m_textfield.dart';
import 'package:flutterproject/onboard/register_password.dart';

class RegisterName extends StatelessWidget {
  static const routeName = 'RegisterName';

  final RegisterNameBloc bloc;
  RegisterName({@required this.bloc});

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
                      'Enter your name',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: StreamBuilder<Object>(
                        stream: bloc.lastNameValidation,
                        builder: (context, snapshot) {
                          return MTextField(
                            placeholder: 'Last Name',
                            type: MTextFieldType.email,
                            isValid: false,
                            onChanged: (text) {
                              bloc.lastNameSubject.add(text);
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: StreamBuilder<Object>(
                        stream: bloc.firstNameValidation,
                        builder: (context, snapshot) {
                          return MTextField(
                            placeholder: 'First Name',
                            type: MTextFieldType.email,
                            isValid: false,
                            onChanged: (text) {
                              bloc.firstNameSubject.add(text);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder<Object>(
                initialData: false,
                stream: bloc.buttonValidation,
                builder: (context, snapshot) {
                  return MRoundButton(
                    buttonTitle: 'Continue',
                    onPressed: () {
                      bloc.setData();
                      Navigator.pushNamed(context, RegisterPassword.routeName);
                    },
                    colorful: snapshot.data,
                    enabled: snapshot.data,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

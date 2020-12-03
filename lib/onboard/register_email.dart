import 'package:flutter/material.dart';
import 'package:flutterproject/bloc/register_email_bloc.dart';
import 'package:flutterproject/client/onboard_client.dart';
import 'package:flutterproject/components/custom_round_button.dart';
import 'package:flutterproject/components/m_textfield.dart';
import 'package:flutterproject/onboard/register_course.dart';

class RegisterEmail extends StatelessWidget {
  static const routeName = 'RegisterEmail';

  final RegisterEmailBloc bloc;
  RegisterEmail({@required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: StreamBuilder<Object>(
              initialData: false,
              stream: bloc.textValidationStream,
              builder: (context, snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter your Email',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: MTextField(
                                placeholder: 'Email',
                                type: MTextFieldType.email,
                                isValid: false,
                                onChanged: (text) {
                                  bloc.controller.add(text);
                                }),
                          )
                        ],
                      ),
                    ),
                    MRoundButton(
                      buttonTitle: 'Continue',
                      onPressed: () {
                        bloc.setData();
                        Navigator.pushNamed(context, RegisterCourse.routeName);
                      },
                      colorful: snapshot.data,
                      enabled: snapshot.data,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

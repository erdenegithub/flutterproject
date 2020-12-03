import 'package:flutter/material.dart';
import 'package:flutterproject/bloc/register_course_bloc.dart';
import 'package:flutterproject/components/custom_round_button.dart';
import 'package:flutterproject/components/m_picker.dart';
import 'package:flutterproject/components/m_picker_bottom_sheet.dart';
import 'package:flutterproject/onboard/register_name.dart';

class RegisterCourse extends StatelessWidget {
  static const routeName = 'RegisterCourse';

  final RegisterCourseBloc bloc;
  RegisterCourse({@required this.bloc});

  void pickerItemDidSelected(int index) {
    bloc.controller.add(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
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
                            'Choose your course',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: MPicker(
                              buttonText: 'Course',
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext ctx) {
                                      return MPickerBottomSheet(
                                        title: 'Course',
                                        didSelectIndex: pickerItemDidSelected,
                                        pickerItems: bloc.pickerItems,
                                      );
                                    });
                              },
                              pickedValue: bloc.getItem(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    MRoundButton(
                      buttonTitle: 'Continue',
                      onPressed: () {
                        bloc.setData();
                        Navigator.pushNamed(context, RegisterName.routeName);
                      },
                      colorful: snapshot.data,
                      enabled: snapshot.data,
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}

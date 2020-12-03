import 'package:flutter/material.dart';

class MRoundButton extends StatelessWidget {
  final String buttonTitle;
  final Function onPressed;
  final bool colorful;
  final bool enabled;

  MRoundButton({
    @required this.buttonTitle,
    @required this.onPressed,
    @required this.colorful,
    @required this.enabled,
  });

  final Gradient buttonGradient = LinearGradient(
    colors: [
      Color(0xffA8C7BE),
      Color(0xffA8C7BE),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  final Gradient disabledGradient = LinearGradient(
    colors: [
      Colors.grey[100],
      Colors.grey[100],
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      child: MaterialButton(
        padding: EdgeInsets.only(left: 0, right: 0),
        onPressed: enabled ? onPressed : null,
        child: Ink(
          decoration: BoxDecoration(
              gradient: colorful ? buttonGradient : disabledGradient),
          child: Container(
            padding: EdgeInsets.only(top: 16),
            constraints: BoxConstraints(minHeight: 50),
            alignment: Alignment.topCenter,
            child: Text(
              buttonTitle,
              style: TextStyle(
                color: Color.fromRGBO(84, 91, 101, 1),
                fontSize: 15,
                fontFamily: 'Rubik-Medium',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

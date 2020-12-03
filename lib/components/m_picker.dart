import 'package:flutter/material.dart';

const notPickedLabelStyle = TextStyle(
  color: Color(0XFFA7AFBA),
  fontSize: 16.0,
);
const pickedLabelStyle = TextStyle(
  color: Color(0XFFA7AFBA),
  fontSize: 12.0,
);
const pickedTextStyle = TextStyle(
  color: Color(0XFF545b65),
  fontSize: 16.0,
);
const buttonColor = Color(0xFFF9FAFB);

class MPicker extends StatelessWidget {
  final String buttonText;
  final String pickedValue;
  final Function onPressed;
  MPicker(
      {@required this.buttonText, this.pickedValue, @required this.onPressed});

  bool get isValid {
    return pickedValue.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: MaterialButton(
        color: buttonColor,
        onPressed: onPressed,
        child: Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              constraints: BoxConstraints(minHeight: 54.0),
              child: isValid
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          buttonText,
                          style: pickedLabelStyle,
                        ),
                        Text(
                          pickedValue,
                          style: pickedTextStyle,
                        ),
                      ],
                    )
                  : Text(
                      buttonText,
                      style: notPickedLabelStyle,
                    ),
            ),
            Spacer(),
            Container(
              alignment: Alignment.centerRight,
              child: Icon(
                isValid ? Icons.check_circle : Icons.arrow_drop_down,
                color: isValid ? Color(0XFFABD382) : Color(0xFFa7afba),
              ),
            )
          ],
        ),
      ),
    );
  }
}

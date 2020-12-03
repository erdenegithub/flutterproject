import 'package:flutter/material.dart';

class MPickerTile extends StatelessWidget {
  final String title;

  const MPickerTile({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: Container(
        height: 54.0,
        decoration: BoxDecoration(
          color: Color.fromRGBO(249, 250, 251, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ),
    );
  }
}

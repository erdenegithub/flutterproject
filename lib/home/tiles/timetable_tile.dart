import 'package:flutter/material.dart';

class TimetableTile extends StatelessWidget {
  final String title;
  final bool isSelected;

  TimetableTile({@required this.title, @required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 60,
      width: (MediaQuery.of(context).size.width - 70) / 7,
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}

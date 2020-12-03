import 'package:flutter/material.dart';
import 'package:flutterproject/components/picker_tile.dart';

class MPickerBottomSheet extends StatelessWidget {
  final ValueChanged<int> didSelectIndex;
  final List<String> pickerItems;
  final String title;

  const MPickerBottomSheet(
      {Key key, this.didSelectIndex, this.pickerItems, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    closeAction() {
      Navigator.of(context).pop();
    }

    double screenHeight = MediaQuery.of(context).size.height - 100;
    double cellHeight = 64 * pickerItems.length.toDouble() +
        45 +
        MediaQuery.of(context).padding.bottom;
    double height = screenHeight >= cellHeight ? cellHeight : screenHeight;

    return Container(
      height: height,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 41),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 25,
                  ),
                  onPressed: () {
                    closeAction();
                  },
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext ctx, int index) {
                return InkWell(
                  onTap: () {
                    didSelectIndex(index);
                    closeAction();
                  },
                  child: MPickerTile(
                    title: pickerItems[index],
                  ),
                );
              },
              itemCount: pickerItems.length,
            ),
          )
        ],
      ),
    );
  }
}

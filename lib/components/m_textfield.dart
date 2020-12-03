import 'package:flutter/material.dart';

enum MTextFieldType {
  email,
  password,
  phone,
}

class MTextField extends StatefulWidget {
  final String placeholder;
  final MTextFieldType type;
  final bool isValid;
  final Function(String) onChanged;
  final String text;

  MTextField(
      {@required this.placeholder,
      @required this.type,
      @required this.isValid,
      @required this.onChanged,
      this.text});

  @override
  State<StatefulWidget> createState() {
    return MTextFieldState();
  }
}

class MTextFieldState extends State<MTextField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  final _activColor = Colors.orange;
  final _inactiveColor = Colors.grey;

  TextInputType get _keyboardType {
    TextInputType temp;
    switch (widget.type) {
      case MTextFieldType.email:
        temp = TextInputType.emailAddress;
        break;
      case MTextFieldType.password:
        temp = TextInputType.text;
        break;
      case MTextFieldType.phone:
        temp = TextInputType.phone;
        break;
    }
    return temp;
  }

  Color get _currenColor {
    return _focusNode.hasFocus ? _activColor : _inactiveColor;
  }

  Widget get prefixIcon {
    return null;
  }

  Widget get suffixIcon {
    if (_focusNode.hasFocus) {
      return Container(
        width: 35.0,
        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
        child: IconButton(
          padding: EdgeInsets.all(0),
          alignment: Alignment.center,
          icon: Icon(Icons.close),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: () {
            _controller.clear();
          },
        ),
      );
    } else {
      return null;
    }
  }

  @override
  void initState() {
    print(widget.text);
    _controller.text = widget.text;
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    print('dispose');
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(249, 250, 251, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          obscureText: widget.type == MTextFieldType.password,
          keyboardType: _keyboardType,
          cursorColor: Colors.orange,
          controller: _controller,
          focusNode: _focusNode,
          style: TextStyle(color: Colors.black, fontSize: 16.0),
          decoration: InputDecoration(
            labelText: widget.placeholder,
            labelStyle: TextStyle(color: _currenColor, fontSize: 16.0),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: _activColor, width: 2),
            ),
            enabledBorder: InputBorder.none,
            suffixIcon: suffixIcon,
            suffixIconConstraints: BoxConstraints(
              minWidth: 35,
              minHeight: 54,
            ),
            prefixIcon: prefixIcon,
            prefixIconConstraints: BoxConstraints(
              minWidth: 35,
              minHeight: 54,
            ),
          ),
          onChanged: (text) {
            widget.onChanged(text);
          },
        ),
      ),
    );
  }
}

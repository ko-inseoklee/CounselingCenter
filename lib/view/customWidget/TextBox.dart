import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final bool isBlank;
  final String hintText;
  TextBox({Key? key, required bool isBlank, required String hintText})
      : isBlank = isBlank, hintText = hintText;

  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      obscureText: isBlank,
      autocorrect: false,
      decoration: InputDecoration(
          // border: InputBorder.none,
          hintText: hintText),
    );
  }

  String getText() {
    return _controller.text;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final bool isBlank;
  TextBox({Key? key,required bool isBlank}) : isBlank = isBlank;

  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      obscureText: isBlank,
      autocorrect: false,
    );
  }

  String getText(){
    return _controller.text;
  }
}

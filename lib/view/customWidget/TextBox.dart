import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  TextBox({Key? key}) : super(key: key);

  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
    );
  }

  String getText(){
    return _controller.text;
  }
}

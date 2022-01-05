import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메인'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('급식들과 주전부리'),
            TextButton(
                onPressed: () {
                  Get.toNamed('/matching');
                },
                child: Text('매칭 페이지'))
          ],
        ),
      ),
    );
  }
}

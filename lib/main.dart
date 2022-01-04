import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_counseling_center/controller/UserController.dart';
import 'package:online_counseling_center/view/Login/Login.dart';

// void main() => runApp(GetMaterialApp(home: Home()));
void main() => runApp(GetMaterialApp(home: LogInPage()));

class Controller extends GetxController{
  var count = 0.obs;
  increment() => count++;
}

class Home extends StatelessWidget {

  var user = Get.find<UserController>();

  @override
  Widget build(context) {

    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Center(child: ElevatedButton(
            child: Text("Go to Other"), onPressed: () => Get.to(Other()))),
        floatingActionButton:
        FloatingActionButton(child: Icon(Icons.add), onPressed: (){
        }));
  }
}

class Other extends StatefulWidget {
  final title = "Other";
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  @override
  _OtherState createState() => _OtherState();
}

class _OtherState extends State<Other> {
  final Controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${c.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: c.increment(),
        tooltip: 'meng',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
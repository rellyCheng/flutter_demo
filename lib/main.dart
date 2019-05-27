import 'package:flutter/material.dart';
import './src/pages/home.dart';
import './src/pages/socket.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: HomePage(),
       routes: <String, WidgetBuilder> {
          '/homePage': (BuildContext context) => new HomePage(),
          '/socketPage': (BuildContext context) => new SocketPage(),
        },
    );
  }

}
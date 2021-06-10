import 'package:flutter/material.dart';
import 'package:project_profilecreation/Screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

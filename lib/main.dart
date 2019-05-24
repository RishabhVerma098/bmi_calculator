import 'package:flutter/material.dart';
import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF090C22),
          scaffoldBackgroundColor: Color(0xFF090C22)),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'BMI CALCULATOR',
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: HomePage(),
      ),
    );
  }
}

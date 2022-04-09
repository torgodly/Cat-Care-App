import 'package:flutter/material.dart';
import 'package:Cat_Care_App/screens/home_screeen.dart';
// import 'package:Cat_Care_App/screens/test.dart';
// ignore_for_file: prefer_const_constructors

void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          Directionality(textDirection: TextDirection.rtl, child: HomeScreen()),
    );
  }
}

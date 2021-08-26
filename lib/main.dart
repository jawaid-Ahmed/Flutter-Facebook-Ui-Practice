// @dart=2.9
import 'package:facebookcloneui/config/palette.dart';
import 'package:facebookcloneui/screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Facebook Ui',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Palette.scaffold,
          visualDensity: VisualDensity.adaptivePlatformDensity,

        ),


        home: NavScreen(),
    );
  }
}



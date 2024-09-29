import 'package:edu_bvrit/screens/chat.dart';
import 'package:edu_bvrit/screens/feature1.dart';
import 'package:edu_bvrit/screens/translation.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/modelv.dart';
import 'utils/const.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EDUCITY',
      debugShowCheckedModeBanner: false,
      theme: Constants.lighTheme(context),
      home: HomeScreen(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/translate': (context) => Mentor(),
        '/3dmodel': (context) => ModelViewerPage(), 
        '/chat': (context) => Cahc(),
      },
    );
  }
}
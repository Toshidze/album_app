import 'package:flutter/material.dart';
import 'screens/mainScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'App album';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData.dark(),
      home: MainScreen(title: appTitle),
    );
  }
}

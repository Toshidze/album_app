import 'package:app_for_trood/provider/data_provider.dart';
import 'package:app_for_trood/repositories/photo_repo.dart';
import 'package:app_for_trood/repositories/post_repo.dart';
import 'package:app_for_trood/repositories/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/main_screen.dart';

void main() => runApp(MyApp());
GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'App album';

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GetData(),
        ),
        ChangeNotifierProvider(
          create: (_) => PostRepo(),
        ),
        ChangeNotifierProvider(
          create: (_) => PhotoRepo(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserRepo(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appTitle,
        theme: ThemeData.dark(),
        home: MainScreen(title: appTitle),
        scaffoldMessengerKey: scaffoldMessengerKey,
      ),
    );
  }
}

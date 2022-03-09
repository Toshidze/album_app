import 'package:app_for_trood/provider/data_provider.dart';
import 'package:app_for_trood/repositories/photo_repo.dart';
import 'package:app_for_trood/repositories/post_repo.dart';
import 'package:app_for_trood/repositories/user_repo.dart';
import 'package:app_for_trood/utilities/mainColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/main_screen.dart';

void main() => runApp(MyApp());
GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
ThemeData light = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        backgroundColor: MainColor.mainAccentColorYelow,
        foregroundColor: Colors.black),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: MainColor.mainColorGrey));

ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    canvasColor: MainColor.mainColorGrey,
    scaffoldBackgroundColor: Colors.blueGrey[800],
    appBarTheme: AppBarTheme(backgroundColor: MainColor.mainColorGrey),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: MainColor.mainAccentColorYelow,
      backgroundColor: MainColor.mainColorGrey,
    ));

class ThemeNotifier extends ChangeNotifier {
  bool _darkTheme = true;

  bool get darkTheme => _darkTheme;

  toggleTheme() {
    _darkTheme = !_darkTheme;

    notifyListeners();
  }
}

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
        child: ChangeNotifierProvider(
            create: (_) => ThemeNotifier(),
            child: Consumer<ThemeNotifier>(
                builder: (context, ThemeNotifier notifier, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: appTitle,
                theme: notifier.darkTheme ? dark : light,
                home: MainScreen(title: appTitle),
                scaffoldMessengerKey: scaffoldMessengerKey,
              );
            })));
  }
}

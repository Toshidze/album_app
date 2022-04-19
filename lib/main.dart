import 'package:app_for_trood/models/post_model.dart';
import 'package:app_for_trood/models/user_address.dart';
import 'package:app_for_trood/models/user_address_geo.dart';
import 'package:app_for_trood/models/user_company.dart';
import 'package:app_for_trood/models/user_model.dart';
import 'package:app_for_trood/provider/data_provider.dart';
import 'package:app_for_trood/repositories/photo_repo.dart';
import 'package:app_for_trood/repositories/post_repo.dart';
import 'package:app_for_trood/repositories/user_repo.dart';
import 'package:app_for_trood/utilities/main_color.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'screens/main_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(document.path);
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(UserAddressAdapter());
  Hive.registerAdapter(UserAddressGeoAdapter());
  Hive.registerAdapter(UserCompanyAdapter());
  Hive.registerAdapter(PostAdapter());
  await Hive.openBox('UserBox');
  await Hive.openBox('PostBox');
  // var box = Hive.box('UserBox');
  // await box.clear();
  runApp(const MyApp());
}

GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
ThemeData light = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: MainColor.mainColorGrey,
    ),
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        backgroundColor: MainColor.mainAccentColorYelow,
        foregroundColor: Colors.black),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: MainColor.mainColorGrey));

ThemeData dark = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: MainColor.mainAccentColorYelow,
    ),
    brightness: Brightness.dark,
    canvasColor: MainColor.mainColorGrey,
    scaffoldBackgroundColor: Colors.blueGrey[800],
    appBarTheme: const AppBarTheme(backgroundColor: MainColor.mainColorGrey),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
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
  const MyApp({Key? key}) : super(key: key);

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
                home: const MainScreen(title: appTitle),
                scaffoldMessengerKey: scaffoldMessengerKey,
              );
            })));
  }
}

import 'package:flutter/material.dart';
import 'package:mqpal/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:mqpal/state.dart';
import 'package:firebase_core/firebase_core.dart';

final lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Color.fromARGB(255, 166, 25, 06),
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    background: Colors.white,
    onBackground: Colors.white,
    secondary: Color.fromARGB(255, 166, 25, 06),
    surface: Color.fromRGBO(222, 226, 230, 100),
    onSurface: Color.fromARGB(255, 147, 147, 147),
  ),
  fontFamily: 'Ubuntu',
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Colors.black,
      fontSize: 50,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      color: Colors.black,
      fontSize: 36,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 26,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 17,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      color: Color.fromARGB(255, 97, 95, 95),
      fontSize: 12,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 50,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
  ),
);

final darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    primary: Color.fromARGB(255, 34, 34, 34),
    onPrimary: Color.fromARGB(255, 88, 85, 85),
    background: Color.fromARGB(255, 21, 21, 21),
    onBackground: Color.fromARGB(255, 89, 89, 89),
    surface: Color.fromARGB(255, 48, 48, 48),
    onSurface: Color.fromARGB(255, 128, 128, 128),
  ),
  fontFamily: 'Ubuntu',
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 50,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    displayLarge: TextStyle(
      color: Colors.white,
      fontSize: 50,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      color: Colors.white,
      fontSize: 36,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 26,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      color: Color.fromARGB(255, 128, 128, 128),
      fontSize: 12,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
  ),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final stateModel = StateModel();
  await Firebase.initializeApp();
  await stateModel.loadInquiries();

  runApp(
    ChangeNotifierProvider(
      create: (_) => StateModel(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<StateModel>(
      builder: (context, value, _) {
        return MaterialApp(
          title: 'MQPal',
          theme: value.isDarkMode ? darkTheme : lightTheme,
          home: const HomeScreen(),
        );
      },
    );
  }
}

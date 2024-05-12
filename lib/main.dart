import 'package:flutter/material.dart';
import 'package:mqpal/firebase_options.dart';
import 'package:mqpal/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:mqpal/state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sizer/sizer.dart';

// dark and light themes. note: sp means scalable pixel and it is from the sizer package.
final lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Color.fromARGB(255, 166, 25, 06),
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    background: Colors.white,
    onBackground: Colors.white,
    secondary: Color.fromARGB(255, 166, 25, 06),
    surface: Color.fromRGBO(222, 226, 230, 100),
    onSurface: Color.fromARGB(255, 147, 147, 147),
    onError: Colors.white,
    error: Colors.white,
  ),
  fontFamily: 'Ubuntu',
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: Colors.black,
      fontSize: 26.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      color: Colors.black,
      fontSize: 20.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
      fontSize: 12.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 16.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: const Color.fromARGB(255, 0, 0, 0),
      fontSize: 16.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: const Color.fromARGB(255, 0, 0, 0),
      fontSize: 12.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      color: Colors.white,
      fontSize: 12.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      color: Colors.white,
      fontSize: 16.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      color: const Color.fromARGB(255, 97, 95, 95),
      fontSize: 8.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 26.sp,
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
      onError: Color.fromARGB(255, 65, 65, 65),
      error: Color.fromARGB(255, 255, 255, 255)),
  fontFamily: 'Ubuntu',
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 26.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    displayLarge: TextStyle(
      color: Colors.white,
      fontSize: 26.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      color: Colors.white,
      fontSize: 20.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      color: Colors.white,
      fontSize: 12.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 16.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
      fontSize: 12.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 16.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      color: Colors.white,
      fontSize: 12.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      color: Colors.white,
      fontSize: 16.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      color: const Color.fromARGB(255, 128, 128, 128),
      fontSize: 8.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
  ),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //launches firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final stateModel = StateModel();
  await stateModel.loadInquiries(); //loads inquiries
  await stateModel.loadConfig(); //loads config, (essentially the theme)
  // all functions relating to launching and loading things from firebase is done prior to running the app to ensure the app is loaded in the correcdt state
  runApp(MainApp(
    stateModel: stateModel,
  ));
}

class MainApp extends StatelessWidget {
  final StateModel stateModel;
  const MainApp({super.key, required this.stateModel});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ChangeNotifierProvider.value(
          value: stateModel,
          child: Consumer<StateModel>(
            builder: (context, value, _) {
              return MaterialApp(
                title: 'MQPal',
                theme: value.isDarkMode ? darkTheme : lightTheme,
                home: const HomeScreen(),
              );
            },
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mqpal/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:mqpal/state.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// dark and light themes. note: sp means scalable pixel and it is from the sizer package.
// In main.dart, replace the theme definitions with these updated versions

final lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Color.fromARGB(255, 166, 25, 06),
    onPrimary: Color.fromARGB(255, 207, 207, 207),
    secondary: Color.fromARGB(255, 166, 25, 06),
    onSecondary:
        Color.fromARGB(255, 172, 172, 172), // Added for better text contrast
    surface: Color.fromARGB(222, 225, 225, 225),
    onSurface:
        Color.fromARGB(255, 243, 243, 243), // Darkened for better contrast
    onError: Colors.white,
    error: Colors.red, // Changed from white to red for proper error indication
  ),
  fontFamily: 'Ubuntu',
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 24.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w500,
    ),
    displayLarge: TextStyle(
      color: Colors.black,
      fontSize: 24.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w500, // Slightly bolder for better visibility
    ),
    displayMedium: TextStyle(
      color: Colors.black,
      fontSize: 20.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w500,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
      fontSize: 12.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
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
    bodyMedium: TextStyle(
      color: const Color.fromARGB(255, 0, 0, 0),
      fontSize: 16.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      color: Colors.white,
      fontSize: 16.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      color: Colors.white,
      fontSize: 14.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w600, // Bolder for better readability on buttons
    ),
    labelSmall: TextStyle(
      color:
          const Color.fromARGB(255, 65, 65, 65), // Darkened for better contrast
      fontSize: 12.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
  ),
);

final darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
      primary: Color.fromARGB(255, 34, 34, 34),
      onPrimary:
          Color.fromARGB(255, 200, 200, 200), // Lightened for better contrast
      secondary:
          Color.fromARGB(255, 200, 60, 40), // Distinct bright color for buttons
      onSecondary: Color.fromARGB(255, 255, 255, 255),
      surface: Color.fromARGB(255, 48, 48, 48),
      onSurface:
          Color.fromARGB(255, 66, 66, 66), // Lightened for better contrast
      onError: Color.fromARGB(255, 65, 65, 65),
      error: Color.fromARGB(255, 255, 100, 100) // More distinct error color
      ),
  fontFamily: 'Ubuntu',
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 24.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w500,
    ),
    displayLarge: TextStyle(
      color: Colors.white,
      fontSize: 34.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w500,
    ),
    displayMedium: TextStyle(
      color: Colors.white,
      fontSize: 20.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w500,
    ),
    displaySmall: TextStyle(
      color: Colors.white,
      fontSize: 12.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w500,
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
      fontSize: 14.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w600, // Bolder for better readability on buttons
    ),
    labelLarge: TextStyle(
      color: Colors.white,
      fontSize: 16.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      color: const Color.fromARGB(
          255, 180, 180, 180), // Lightened for better readability
      fontSize: 12.sp,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w400,
    ),
  ),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //launches firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

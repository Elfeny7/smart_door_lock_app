import 'package:flutter/material.dart';
import 'package:smart_door_lock_app/route/route.dart';
import 'package:smart_door_lock_app/views/open_door_screen.dart';

import '../views/doors_screen.dart';
import '../views/login_screen.dart';
import '../views/result_screen.dart';

class MainAppView extends StatefulWidget {
  const MainAppView({super.key});

  @override
  State<MainAppView> createState() => _MainAppViewState();
}

class _MainAppViewState extends State<MainAppView> {
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = const LoginScreen();

    return MaterialApp(
      initialRoute: '/',
      routes: {
        // splash: (context) => SplashScreen(),
        login: (context) => const LoginScreen(),
        doors: (context) => DoorsScreen(
            userId: ModalRoute.of(context)?.settings.arguments as String,
            pin: ModalRoute.of(context)?.settings.arguments as String),
        openDoor: (context) => OpenDoorScreen(
            door: ModalRoute.of(context)?.settings.arguments
                as Map<String, dynamic>,
            pin: ModalRoute.of(context)?.settings.arguments as String),
      },
      home: screenWidget,
    );
  }
}

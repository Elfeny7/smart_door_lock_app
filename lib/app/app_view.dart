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
  var activeScreen = 'login-screen';

  void switchLoginScreen() {
    setState(() {
      activeScreen = 'login-screen';
    });
  }

  void switchDoorsScreen() {
    setState(() {
      activeScreen = 'doors-screen';
    });
  }

  void switchOpenDoorScreen() {
    setState(() {
      activeScreen = 'open-door-screen';
    });
  }

  void switchResultScreen() {
    setState(() {
      activeScreen = 'result-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = LoginScreen(onLoginButton: switchDoorsScreen);

    if (activeScreen == 'login-screen') {
      screenWidget = LoginScreen(onLoginButton: switchDoorsScreen);
    }

    if (activeScreen == 'doors-screen') {
      screenWidget = DoorsScreen(onSelectDoorButton: switchOpenDoorScreen);
    }

    if (activeScreen == 'open-door-screen') {
      screenWidget = OpenDoorScreen(onOpenDoorButton: switchResultScreen);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(onFinishButton: switchLoginScreen);
    }

    return MaterialApp(
      initialRoute: '/',
      routes: {
        // splash: (context) => SplashScreen(),
        login: (context) => LoginScreen(onLoginButton: switchDoorsScreen),
        doors: (context) => DoorsScreen(onSelectDoorButton: switchOpenDoorScreen),
      },
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 248, 248, 248),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

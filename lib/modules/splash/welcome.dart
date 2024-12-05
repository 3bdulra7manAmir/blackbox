// ignore_for_file: unused_import

import 'package:black_box/modules/login/login.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  final bool isLoaded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.cover
          ),
        ),
        width: double.infinity,
        height: double.infinity,
      
      child: SplashScreenView(
      navigateWhere: isLoaded,
      navigateRoute: const LoginScreen(),
      duration: const Duration(seconds: 2),
      //speed: const Duration(milliseconds: 100),
      //imageSrc: "assets/images/vault.png",
      imageSrc: "assets/images/tmc.png",
      logoSize: 450,

      text: WavyAnimatedText(".............",
        textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),

    );
  }
}


// class Welcome extends StatelessWidget {
//   const Welcome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: AnimatedSplashScreen(
//             duration: 1000,
//             splash: Icons.home,
//             nextScreen: const Login(),
//             splashTransition: SplashTransition.fadeTransition,
//             pageTransitionType: PageTransitionType.scale,
//             backgroundColor: Colors.blue));
//   }
// }


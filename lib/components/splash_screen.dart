import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kebu_app/components/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  // Starts a timer to navigate to the LoginScreen after a delay
  startTimer() async {
    var duration = const Duration(seconds: 3); // Duration for splash screen
    // Call loginRoute() after the duration
    Timer(duration, loginRoute);
  }

  // Navigates to LoginScreen
  loginRoute() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with Gradient Color
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFFFA016), // Main background color
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFFA016),
                  Color(0xFFFFA016),
                ], // Gradient effect with the same color
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Logo centered in the middle of the screen
          Center(
            child: AnimatedOpacity(
              opacity: 1.0, // Control opacity for fade-in effect (optional)
              duration:
                  const Duration(seconds: 1), // Duration for fade-in effect
              child: Image.asset(
                "images/splashscreen_icon.png", // Your logo image
                width: 400, // You can adjust the size of the logo here
                height: 400,
                fit: BoxFit.contain, // Prevents distortion of the logo
              ),
            ),
          ),
        ],
      ),
    );
  }
}

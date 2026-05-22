import 'package:flutter/material.dart';
import 'dart:async';
import 'homeScreen.dart';
import 'loginScreen.dart';
/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}*/

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,

        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        // Background Color
        color: const Color.fromARGB(144, 76, 211, 161),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // TOP SECTION
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "1.0",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 230),

            // MIDDLE SECTION
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hostel Complain App",
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),

                  SizedBox(height: 20),

                  Icon(
                    Icons.apartment,
                    size: 100,
                    color: const Color.fromARGB(255, 221, 119, 9),
                  ),

                  SizedBox(height: 27),

                  Container(
                    padding: EdgeInsets.all(20),

                    child: CircularProgressIndicator(
                      color: const Color.fromARGB(255, 125, 201, 104),
                      strokeWidth: 6,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 230),

            // BOTTOM SECTION
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Copyright © 2024-2026 TechWorld.All Rights Reserved.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

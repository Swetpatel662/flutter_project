import 'package:flutter/material.dart';

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

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        // Background Color
        color: const Color.fromARGB(144, 177, 206, 207),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // TOP SECTION
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // ADD WIDGETS HERE
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
                  // ADD WIDGETS HERE

                  //mainAxisAlignment: MainAxisAlignment.center,
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

                    /*decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 230, 235, 93),
                      borderRadius: BorderRadius.circular(20),
                    ),*/
                    child: CircularProgressIndicator(
                      color: const Color.fromARGB(255, 125, 201, 104),
                      strokeWidth: 6,
                    ),
                  ),
                ],
              ),
            ),

            //Image.asset("assets/images/hostel.png", height: 20),
            SizedBox(height: 298),

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
                  // ADD WIDGETS HERE
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

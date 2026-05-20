import 'package:flutter/material.dart';
import 'SignUp.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        // Background Color
        color: Colors.white,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TOP SECTION
            const SizedBox(height: 160),
            Icon(
              Icons.account_circle,
              size: 100,
              color: const Color.fromARGB(43, 16, 16, 16),
            ),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //const SizedBox(height: 70),
                children: [
                  // ADD WIDGETS HERE
                  Text(
                    "User Login",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),

              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),

                  hintText: "Email ID",

                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),

                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // PASSWORD FIELD
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),

              child: TextField(
                obscureText: true,

                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),

                  hintText: "Password",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),

                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
            ),
            // MIDDLE SECTION
            const SizedBox(height: 20),

            // REMEMBER + FORGOT PASSWORD
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),

                      Text("Remember me"),
                    ],
                  ),

                  TextButton(onPressed: () {}, child: Text("Forgot Password?")),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // LOGIN BUTTON
            SizedBox(
              width: 250,
              height: 50,

              child: ElevatedButton(
                onPressed: () {},

                child: Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text("don't have an account?"),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,

                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: Text("Sign Up"),
                ),
              ],
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ADD WIDGETS HERE
                ],
              ),
            ),

            SizedBox(height: 40),

            // BOTTOM SECTION
            Container(
              child: Column(
                children: [
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

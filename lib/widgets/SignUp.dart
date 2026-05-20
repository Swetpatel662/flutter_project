import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 216, 188, 235),
              Color.fromARGB(255, 185, 223, 230),
            ],

            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 70),

              // ICON + TITLE
              Container(
                child: Column(
                  children: [
                    Icon(Icons.account_circle, size: 100, color: Colors.blue),

                    SizedBox(height: 10),

                    Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // NAME FIELD
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),

                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),

                    hintText: "Full Name",

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

              // EMAIL FIELD
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

              // PHONE FIELD
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),

                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),

                    hintText: "Phone Number",

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

              const SizedBox(height: 20),

              // CONFIRM PASSWORD FIELD
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),

                child: TextField(
                  obscureText: true,

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),

                    hintText: "Confirm Password",

                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),

                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // SIGNUP BUTTON
              SizedBox(
                width: 250,
                height: 50,

                child: ElevatedButton(
                  onPressed: () {},

                  child: Text(
                    "SIGN UP",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // LOGIN SECTION
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text("Already have an account?"),

                  TextButton(onPressed: () {}, child: Text("LOGIN")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

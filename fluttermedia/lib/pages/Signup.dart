import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final emailDecoration = InputDecoration(
      hintText: 'Enter Email',
      hintStyle: GoogleFonts.alice(color: Colors.black),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
  final passwordDecoration = InputDecoration(
      hintText: 'Enter Password',
      hintStyle: GoogleFonts.alice(color: Colors.black),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
  final confirmpasswordDecoration = InputDecoration(
      hintText: 'Enter Password',
      hintStyle: GoogleFonts.alice(color: Colors.black),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Signup",
                style: GoogleFonts.alice(color: Colors.green, fontSize: 50),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: emailController,
                      decoration: emailDecoration,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: passwordController,
                      decoration: passwordDecoration,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: confirmpasswordController,
                      decoration: confirmpasswordDecoration,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Signup',
                          style: GoogleFonts.alice(),
                        ),
                      ),
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Go Back',
                          style: GoogleFonts.alice(),
                        ),
                      ),
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}

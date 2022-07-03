import 'package:flutter/material.dart';
import 'package:fluttermedia/pages/Landing.dart';
import 'package:fluttermedia/pages/Signup.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final emailDecoration = InputDecoration(
      hintText: 'Enter Email',
      hintStyle: GoogleFonts.alice(color: Colors.black),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
  final passwordDecoration = InputDecoration(
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
                "Login",
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'ForgotPassword ? ',
                          style: GoogleFonts.alice(color: Colors.white),
                        )),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Landing()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Login',
                          style: GoogleFonts.alice(fontSize: 16),
                        ),
                      ),
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text('Signup'),
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

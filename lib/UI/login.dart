import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery1/UI/product/product_listing.dart';
import 'package:grocery1/UI/signUp.dart';

import '../database/database_helper.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKeyLogin = GlobalKey<FormState>();
  final DatabaseHelper databaseHelper = DatabaseHelper();
  void signIn() async {
    final email = emailController.text;
    final password = passwordController.text;

    final user = await databaseHelper.signInUser(email, password);

    if (user != null) {
      var snackBar = const SnackBar(content: Text('Login Successful'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListingScreen()));

      // Authentication successful, navigate to the home screen or perform any required actions.
    } else {
      var snackBar = const SnackBar(content: Text('Please login with correct credentials.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // Show an error message for invalid email or password.
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 80),
            child: Form(
              key: _formKeyLogin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(height: 70,),
                  const Center(
                    child: Text("Log In",
                      style: TextStyle(
                          fontSize: 35,
                          color: Color(0xFF00008B),
                          fontWeight: FontWeight.bold),
                    )
                  ),
                  const SizedBox(height: 40,),
                  const Text("Sign In to your Account",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: emailController,
                    validator: (val) {
                      if (val == "") {
                        return "Please enter email aadress";
                      } else {
                        final bool emailValid =
                        RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(val!.trim());
                        if (emailValid == true) {
                          return null;
                        } else {
                          return "please enter valid email address";
                        }
                      } // Return null if the input is valid
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',

                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Password';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 24.0),
                     ElevatedButton(
                      onPressed: () {
                              if (_formKeyLogin.currentState!.validate()) {
                                signIn();
                              }
                      },
                       style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF00008B)),

                         minimumSize: MaterialStateProperty.all(const Size(350, 50)), // Adjust the desired size
                       ),
                      child: const Text('Login',
                        style: TextStyle(
                            fontSize: 18,),),
                    ),
                  const SizedBox(height: 50.0),
                  Center(
                    child: RichText(
                      text:   TextSpan(
                        text: "Don't have an account? ",
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign Up',
                            style: const TextStyle(fontSize:15,fontWeight: FontWeight.bold,
                                color: Color(0xFF00008B)),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                              print("sign up screen");
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                                // Handle the "Sign Up" tap event
                                // _handleSignUpTap(context);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery1/UI/login_controller.dart';
import 'package:grocery1/UI/signUp.dart';
import 'package:get/get.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _HomePageState();
}

class _HomePageState extends State<LogIn> {
  LoginController controller = Get.put(LoginController());
  final _formKeyLogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 80),
          child: SingleChildScrollView(
            child: Form(
              key: _formKeyLogin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   SizedBox(height: 70,),
                  Center(
                    child: Text("LogIn",
                      style: TextStyle(
                          fontSize: 35,
                          color: Color(0xFF00008B),
                          fontWeight: FontWeight.bold),
                    )
                  ),
                  SizedBox(height: 40,),
                  Text("LogIn to your Account",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: controller.emailController.value,
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
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: controller.passwordController.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    // obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(height: 24.0),
                     ElevatedButton(
                      onPressed: () {
                          if (_formKeyLogin.currentState!.validate()) {
                            controller.loginApi();
                          }
                      },
                       // style: ElevatedButton.styleFrom(

                       //   primary: Colors.blue, // Set the background color
                       //   onPrimary: Colors.white, // Set the text color
                       // ),
                       style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF00008B)),

                         minimumSize: MaterialStateProperty.all(Size(350, 50)), // Adjust the desired size
                       ),
                      child: Text('Login',
                        style: TextStyle(
                            fontSize: 18,),),
                    ),
                  SizedBox(height: 50.0),
                  // Center(
                  //   child: Text("- Or Sign in with -",
                  //     style: TextStyle(
                  //         fontSize: 15,
                  //         color: Colors.black54,
                  //         fontWeight: FontWeight.w400),
                  //   ),
                  // ),
                  // SizedBox(height: 50,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //      SizedBox(
                  //       height: 30,
                  //        width: 30,
                  // child: Image.asset('assets/images/google_image.png')),
                  //     SizedBox(
                  //         height: 30,
                  //         width: 30,
                  //         child: Image.asset('assets/images/facebook_image.png')),
                  //     SizedBox(
                  //         height: 30,
                  //         width: 30,
                  //         child: Image.asset('assets/images/twitter_image.png')),
                  //   ],
                  // ),
                  // SizedBox(height: 50,),
                  Center(
                    child: RichText(
                      text:   TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,
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

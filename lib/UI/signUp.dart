import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'courses_listing.dart';
import 'login_controller.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  LoginController controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 60),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      print("back");
                    },
                    child: const Icon(Icons.arrow_back,
                      color: Color(0xFF00008B),
                    ),
                  ),
                   SizedBox(height: 20,),
                  Center(
                      child: Text("Sign Up",
                        style: TextStyle(
                            fontSize: 35,
                            color: Color(0xFF00008B),
                            fontWeight: FontWeight.bold),
                      )
                  ),
                  SizedBox(height: 40,),
                  Text("Create your Account",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: controller.nameController.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null; // Return null if the input is valid
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                      // validation: (pass) {
                      //   return RegExpression.emptyTextValidate(
                      //       pass,
                      //       context.locale.pleaseEnterThePassword,
                      //       context);
                      // },
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: controller.emailSignController.value,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
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
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: controller.mobileController.value,
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                    ),
                    validator: (val) {
                      if (val == "") {
                        return "Please enter mobile number";
                      } else {
                        if (val?.length == 10) {
                          return null;
                        } else {
                          return "please valid mobile number";
                        }
                      }// Return null if the input is valid
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: controller.passController.value,
                    // obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: controller.confirmPassController.value,
                    // obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Confirm Password is required';
                      }
                      if (value != controller.passController.value.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40,),
                  ElevatedButton(
                    onPressed: () {

                      print("object");
                      if (_formKey.currentState!.validate()) {
                        controller.signUpApi();
                      }
                      // Get.toNamed('/home');
                      // Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage()));
                      // Button action
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF00008B)),

                      minimumSize: MaterialStateProperty.all(Size(350, 50)), // Adjust the desired size
                    ),
                    child: Text('Sign Up',
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
                  //     SizedBox(
                  //         height: 30,
                  //         width: 30,
                  //         child: Image.asset('assets/images/google_image.png')),
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

                ],
              ),
            ),
          ),
        )
    );
  }
}

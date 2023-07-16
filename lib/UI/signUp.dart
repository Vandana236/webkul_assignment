import 'package:flutter/material.dart';

import 'home.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 60),
          child: SingleChildScrollView(
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
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                ),
                SizedBox(height: 40,),
                ElevatedButton(
                  onPressed: () {
                    print("object");
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage()));
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
                Center(
                  child: Text("- Or Sign in with -",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset('assets/images/google_image.png')),
                    SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset('assets/images/facebook_image.png')),
                    SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset('assets/images/twitter_image.png')),
                  ],
                ),

              ],
            ),
          ),
        )
    );
  }
}

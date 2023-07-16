import 'package:flutter/material.dart';

import 'data_Detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return     Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00008B),
        title: Text("Home"),),
      body:   Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: GestureDetector(
                  onTap: () {
                    print("object");
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  Detail()));
                    // Button action
                  },
                  child: Container(
                    height: 150,
                    width: 300,
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children:[
                          Icon(Icons.account_circle,size: 80,),
                          SizedBox(width: 20,),
                          Text("Data",
                            style: TextStyle(fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),),
                        ]
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      )
    );
  }
}

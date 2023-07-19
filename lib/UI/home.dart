import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data_Detail.dart';
import 'login_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final getDataController = Get.put(LoginController());
  late final LoginController getDataController;

 @override
  void initState() {
   super.initState();
   print("data is coming ");
   getDataController = Get.put(LoginController());
   getDataController.getDataFromApi();
   // print("data is coming ");
   // getDataController.getDataFromApi();
   //  super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Obx(() =>
        Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF00008B).withOpacity(0.1),
              title: Text("Home",

              ),),
            body:   !getDataController.isLoading.value?
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: getDataController.getDataModel.value.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          print("object");
                          // Get.toNamed('/detail');
                          // Navigator.push(context, MaterialPageRoute(builder: (context) =>  Detail()));
                          // Button action
                        },
                        child: Container(
                          color: Color(0xFF00008B).withOpacity(0.1),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Image.network(
                                  getDataController.getDataModel.value.data![index].imageUrl ?? 'assets/images/almond.png',
                                  fit: BoxFit.fitWidth,
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                  child: Text(
                                    getDataController.getDataModel.value.data![index].name??"name",
                                    style: TextStyle(fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ) :const Center(
              child: CircularProgressIndicator(),
            )
        ));
  }
}

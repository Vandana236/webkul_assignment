
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/course_list.dart';
import '../model/video_list.dart';
import 'courses_listing.dart';


class LoginController extends GetxController{
 final emailController = TextEditingController().obs;
 final passwordController = TextEditingController().obs;

 final nameController = TextEditingController().obs;
 final emailSignController = TextEditingController().obs;
 final mobileController = TextEditingController().obs;
 final passController = TextEditingController().obs;
 final confirmPassController = TextEditingController().obs;

 // var isloading = false.obs;
 // var getDataModel = AllCourseModel().obs;
 final getDataModel = Rx<AllCourseModel>(AllCourseModel());
 final isLoading = RxBool(true);

 final getVideoModel = Rx<VideoListModel>(VideoListModel());
 final loading = RxBool(true);


 void loginApi()async{
   try{
     final response = await http.post(Uri.parse('http://13.233.151.69:8081/user/login'),
       body: {
         'email': emailController.value.text,
         'password': passwordController.value.text
       });
     var data = jsonDecode(response.body);
     print(response.statusCode);
     print(data);
     if(response.statusCode==200){
       if (data["status"] == 403)
         {
           Get.snackbar(data["message"].toString(),"");
         }
       else {
           Get.snackbar("Login Successfully", '');
           Get.toNamed('/home');
         }
     }else{
       Get.snackbar("Login Failed", "error");
     }
   }catch(e){
     print("Error occurred: $e");
     Get.snackbar("Error", "An error occurred during login.");
   }
 }
 void signUpApi()async{
   try{
     final response = await http.post(Uri.parse('http://13.233.151.69:8081/user/signup'),
         body: {
           "name" : nameController.value.text,
           "email" : emailSignController.value.text,
           "password" : passController.value.text,
           "phone" :  mobileController.value.text
         });
     var data = jsonDecode(response.body);
     print(response.statusCode);
     print(data);
     if(response.statusCode==200){
       if (data["status"] == 403)
       {
         Get.snackbar(data["message"].toString(), '');
       }
       else {
         Get.snackbar("SignUp Successfully", '');
         Get.toNamed('/login');
       }
     }else{
       Get.snackbar("Login Failed", "error");
     }
   }catch(e){
     print("Error occurred: $e");
     Get.snackbar("Error", "An error occurred during login.");
   }
 }
 getDataFromApi() async {
   isLoading.value = true;
   try {
     var response = await http.get(Uri.parse('http://13.233.151.69:8081/user/allCourses'));
     Map<String, dynamic> jsonData = jsonDecode(response.body);
     getDataModel.value = AllCourseModel.fromJson(jsonData);
     // getDataModel.value = AllCourseModel.fromJson(response.body);
     print(response);
   } catch (e) {
     print(e);
   }
   isLoading.value = false;
 }

 void getVideosFromApi() async {
   loading.value = true;
   try {
     var response = await http.get(Uri.parse('http://13.233.151.69:8081/user/courseVideo?courseId=3'));
     Map<String, dynamic> jsonData = jsonDecode(response.body);
     getVideoModel.value = VideoListModel.fromJson(jsonData);
     // getDataModel.value = AllCourseModel.fromJson(response.body);
     print(response);
   } catch (e) {
     print(e);
   }
   loading.value = false;
}
}

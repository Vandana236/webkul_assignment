import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/video_list.dart';
import 'data_Detail.dart';
import 'login_controller.dart';

class CourseDataList extends StatefulWidget {
  const CourseDataList({Key? key}) : super(key: key);

  @override
  State<CourseDataList> createState() => _CourseDataListState();
}

class _CourseDataListState extends State<CourseDataList> {
  final LoginController videoController = Get.put(LoginController());
  // void _goToDetailScreen() {
  //   // VideoListModel videoModel = ...; // Provide the appropriate VideoListModel data here
  //
  //   // Navigate to the detail screen and pass the VideoListModel data
  //   Get.toNamed('/detail', arguments: Detail(videoModel: VideoListModel()));
  //   }
  @override
  void initState() {
    super.initState();
    videoController.getVideosFromApi();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00008B).withOpacity(0.1),
        title: Text("Course Detail"),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              print("object");
              // Get.toNamed('/courseList');
              // Get.toNamed('/video');
              // Navigator.push(context, MaterialPageRoute(builder: (context) =>  Detail()));
              // Button action
            },
            child: Column(
                children:[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                       'https://option-trading-courses.s3.ap-south-1.amazonaws.com/test1/business-graph-chart-of-stock-market-investment-on-blue-background-vector.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                         "Data is coming",
                        style: TextStyle(fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ]
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Code to execute when the button is pressed.
              print('Button pressed!');
            },
            child: Text('Buy Now'),
            style: ElevatedButton.styleFrom(
              // Set the desired width of the button
              minimumSize: Size(360, 45), // Width x Height
            ),
          ),
          SizedBox(height: 20,),
          Obx(() {
            return  Flexible(
              flex: 2,
              child: ListView.builder(
                itemCount:
                videoController.getVideoModel.value.data?.length??0,
                itemBuilder: (context, index) {
                  final video = videoController.getVideoModel.value.data![index];
                  return
                    Column(
                      children: [
                        ListTile(
                             title: Text(video.name!,
                               style: TextStyle(fontSize: 18,
                                 color: Colors.black,),),
                          trailing: Icon(Icons.lock),
                          onTap: (){
                            // _goToDetailScreen;
                            Get.toNamed('/detail');
                              // Get.toNamed('/detail',arguments: Detail(videoModel: VideoListModel()));
                          },

                  ),
                        Container(height: 0.4,width: MediaQuery.of(context).size.width,color: Colors.grey,)
                      ],
                    );
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap:(){
                          Get.toNamed('/detail',);
                        },
                        child: Container(
                          color:Colors.red,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 12,horizontal: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  video.name!,
                                  style: TextStyle(fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(Icons.lock)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(height: 0.5,width: MediaQuery.of(context).size.width,
                        color: Colors.black.withOpacity(0.5),)
                    ],
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}

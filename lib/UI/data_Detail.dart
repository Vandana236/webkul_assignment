import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:grocery1/UI/video_player.dart';
// import 'package:better_player/better_player.dart';
import 'package:grocery1/UI/video_player.dart';
// import '../model/video_list.dart';
import 'login_controller.dart';

class Detail extends StatefulWidget {
  // final VideoListModel videoModel;
    const Detail({Key? key, }) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final LoginController videoController = Get.put(LoginController());


  // String receivedData = Get.arguments as String;

  @override
  void initState() {
    videoController.getVideosFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body:   Container(
        color: Colors.black,
        child: Stack(
          children: [
            Obx(() {
              if (videoController.isLoading.value) {
                return const CircularProgressIndicator();
              } else {
                return VideoPlayerScreen(videoUrl:
                videoController.getVideoModel.value.data![0].url!);
              }
            }),
            Positioned(
                top: MediaQuery.of(context).padding.top + 10.0,
                left: 10.0,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),)
          ],
        ),
      )
    );
  }
}

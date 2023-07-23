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
      appBar: AppBar(
        backgroundColor: const Color(0xFF00008B).withOpacity(0.1),
        title: const Text("video Detail"),
      ),
      body:  Obx(() {
          if (videoController.isLoading.value) {
            return const CircularProgressIndicator();
          } else {
            return SizedBox(
                height: 250,
                width:
                MediaQuery.of(context).size.width,
                child:
                // BetterPlayer.network(videoController.getVideoModel.value.data![0].url!,
                // betterPlayerConfiguration: const BetterPlayerConfiguration(aspectRatio: 16/9),)
                VideoPlayerScreen(videoUrl:
                videoController.getVideoModel.value.data![0].url!)
            );
          }
      })
    );
  }
}

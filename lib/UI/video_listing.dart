import 'package:flutter/material.dart';
import 'package:grocery1/UI/video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class VideoListing extends StatefulWidget {
  const VideoListing({Key? key}) : super(key: key);

  @override
  State<VideoListing> createState() => _VideoListingState();
}

class _VideoListingState extends State<VideoListing> {
  final LoginController videoController = Get.put(LoginController());
  //late VideoPlayerController _controller;


  @override
  void initState() {
    super.initState();
    videoController.getVideosFromApi();
    //final dataModel = videoController.getVideoModel.value;
    // _controller = VideoPlayerController.networkUrl(Uri.parse(dataModel.data![0].url!))
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });
    // setState(() {});
  }

  @override
  void dispose() {
    // if (_controller.value.isInitialized) {
    //   _controller.dispose();
    // }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00008B).withOpacity(0.1),
        title: Text("Video Listing"),
      ),
      body:  Center(
        child: Obx(() {
          if (videoController.isLoading.value) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: videoController.getVideoModel.value.data?.length??0,
              itemBuilder: (context, index) {
                final video = videoController.getVideoModel.value.data![index];
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 250,
                          width: MediaQuery.of(context).size.width,
                          child: VideoPlayerScreen(videoUrl:  video.url!)),
                      Text(video.name!,
                        style: TextStyle(fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  // onTap: () {
                  //   // _playVideo(context, video.imageUrl);
                  // },
                );
              },
            );
          }
        }),
      ),
    );
  }
}

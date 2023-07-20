import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        // Ensure the video is initialized.
        // _controller.play();
        setState(() {});
      });
    print(_controller);
    print(widget.videoUrl);
  }



  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
         children: [
           Center(
             child:   _controller.value.isInitialized
                 ? AspectRatio(
               aspectRatio: _controller.value.aspectRatio,
               child: VideoPlayer(_controller),
             )
                 : const CircularProgressIndicator(),
           ),
           InkWell(
               onTap: (){
                 print("click xcvbnm,");
                 setState(() {
                   if(_controller.value.isInitialized) {
                     print("click");
                     _controller.value.isPlaying
                         ? _controller.pause()
                         : _controller.play();
                   }else{
                     print("click not ");
                     _controller.initialize();
                   }
                 });
               },
               child: Padding(
                 padding: const EdgeInsets.all(15),
                 child: Center(child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                   color: Colors.white,
                   size: 50,
                 )),
               )),
         ],
      )

    );
  }
}

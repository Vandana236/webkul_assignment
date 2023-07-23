import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  String _formatDurationInSeconds(Duration duration) {
    return '${duration.inSeconds}';
  }
  // late bool _isVideoInitialized;
  // late bool _isPlaying;
  // late VideoPlayerController _videoPlayerController;
  // late ChewieController _chewieController;


  @override
  void initState() {
    super.initState();
    // _initializeVideoPlayer;
    // _isVideoInitialized = false;
    // _isPlaying = false;
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {
          // _isVideoInitialized = true;
        });
      });
    print(_controller);
    print(widget.videoUrl);
  }
  // void _initializeVideoPlayer() {
  //   _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
  //   _chewieController = ChewieController(
  //     videoPlayerController: _controller,
  //     autoPlay: true,
  //     looping: false,
  //     // Custom options
  //     additionalOptions:  (context){
  //       return <OptionItem> [
  //         OptionItem(onTap: (){}, iconData: Icons.share, title: "share")
  //       ];
  //     }, // Implement a custom control builder
  //   );
  //   _controller.initialize().then((_) {
  //     setState(() {});
  //   });
  // }


  @override
  void dispose() {
    // _chewieController.dispose();
    _controller.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      // _controller.value.isInitialized?
      //     Padding(padding: EdgeInsets.symmetric(vertical: 10),
      //     child: Chewie(
      //       controller: _chewieController,
      //     )
      //     ):Center(
      //   child: CircularProgressIndicator(),
      // )

      Stack(
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
           _controller.value.isInitialized
               ? Positioned(
             bottom: 0,
             left: 0,
             right: 0,
             child: Column(
               children: [
                 // LinearProgressIndicator(
                 //   value: _controller.value.position.inMilliseconds /
                 //       _controller.value.duration.inMilliseconds,
                 //   valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                 //   backgroundColor: Colors.grey,
                 // ),
                 Container(
                   color: Colors.black.withOpacity(0.5),
                   child: SliderTheme(
                     data: SliderThemeData(
                       trackHeight: 4.0, // Adjust the track height as needed
                       thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
                       overlayShape: RoundSliderOverlayShape(overlayRadius: 15),
                       tickMarkShape: RoundSliderTickMarkShape(),
                       valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                       trackShape: RectangularSliderTrackShape(),


                       // Here, we remove the padding around the Slider
                       // by setting the overlayInsets to EdgeInsets.zero

                     ),
                     child: Slider(
                       value: _controller.value.position.inSeconds.toDouble(),
                       min: 0.0,
                       max: _controller.value.duration.inSeconds.toDouble(),
                       onChanged: (newValue) {
                         setState(() {
                           _controller.seekTo(Duration(seconds: newValue.toInt()));
                         });
                       },
                       // Show the timing on the thumb using Tooltip
                       label: _formatDurationInSeconds(_controller.value.position),
                       divisions: _controller.value.duration.inSeconds,
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 8),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         _formatDuration(_controller.value.position),
                         style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                       ),
                       Text(
                         _formatDuration(_controller.value.duration),
                         style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                       ),
                     ],
                   ),
                 ),

               ],
             ),
           )
               : Container(),
         ],
      )

    );
  }
}

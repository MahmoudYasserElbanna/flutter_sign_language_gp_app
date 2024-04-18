import 'package:flutter/material.dart';
import 'package:sign_language_gp_app/constants.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late bool isPlaying;

  @override
  void initState() {
    super.initState();
    isPlaying = true; // Set initial state to playing
    widget.controller.initialize().then((_) {
      setState(() {});
      if (isPlaying) {
        widget.controller.play(); // Auto-play when initialized
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isPlaying = !isPlaying;
                if (isPlaying) {
                  widget.controller.play();
                } else {
                  widget.controller.pause();
                }
              });
            },
            child: Container(
              width: double.infinity,
              height: 48,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 32,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      isPlaying = !isPlaying;
                      if (isPlaying) {
                        widget.controller.play();
                      } else {
                        widget.controller.pause();
                      }
                    });
                  },
                ),
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: widget.controller.value.aspectRatio,
            child: VideoPlayer(widget.controller),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}

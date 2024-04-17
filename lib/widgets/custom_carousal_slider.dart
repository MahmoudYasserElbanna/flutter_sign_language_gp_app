import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomCarousalSlider extends StatefulWidget {
  const CustomCarousalSlider({
    super.key,
    required this.videosUrls,
    required this.videoControllers,
  });
  final List<String> videosUrls;
  final List<VideoPlayerController> videoControllers;

  @override
  State<CustomCarousalSlider> createState() => _CustomCarousalSliderState();
}

class _CustomCarousalSliderState extends State<CustomCarousalSlider> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

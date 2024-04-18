import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_language_gp_app/widgets/custom_video_player.dart';
import 'package:video_player/video_player.dart';

class CustomCarousalSlider extends StatelessWidget {
  const CustomCarousalSlider({
    super.key,
    required this.videosUrls,
    required this.videoControllers,
  });
  final List<String> videosUrls;
  final List<VideoPlayerController> videoControllers;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 650.h,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 6),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 1,
        enableInfiniteScroll: false,
      ),
      itemCount: videosUrls.length,
      itemBuilder: (context, index, realIndex) {
        if (videosUrls.isEmpty || videoControllers.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0XFF0F4C75),
            ),
          );
        } else {
          return VideoPlayerWidget(
            controller: videoControllers[index],
          );
        }
      },
    );
  }
}

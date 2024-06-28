import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sign_language_gp_app/constants.dart';
import 'package:sign_language_gp_app/helpers/api.dart';
import 'package:sign_language_gp_app/models/speech2text_model.dart';
import 'package:sign_language_gp_app/service/get_text_by_text.dart';
import 'package:sign_language_gp_app/widgets/custom_text_filed.dart';
import 'package:sign_language_gp_app/widgets/custom_video_player.dart';
import 'package:sign_language_gp_app/widgets/drawer_body.dart';
import 'package:video_player/video_player.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);
  static String id = 'landingView';
  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  final firestore = FirebaseStorage.instance;
  final TextEditingController textEditingController = TextEditingController();
  late List<String> videosUrls = [];
  late List<VideoPlayerController> videoControllers = [];

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      setState(() {
        videosUrls.clear();
        videoControllers.forEach((controller) {
          controller.dispose();
        });
        videoControllers.clear();
      });
    });
  }

  @override
  void dispose() {
    videoControllers.forEach((controller) {
      controller.dispose();
    });

    super.dispose();
  }

  Future<void> getVideoUrls(String query) async {
    Api api = Api();
    Translate translate = Translate(api);
    try {
      Speech2Text speech2Text = await translate.translate(text: query);
      List<dynamic> speechIds = speech2Text.ids;

      for (dynamic searchQuery in speechIds) {
        if (searchQuery is List) {
          for (dynamic queryWithList in searchQuery) {
            print('Query List : ' + queryWithList.toString());
            final ref = firestore.ref().child('$queryWithList.mp4');
            final url = await ref.getDownloadURL();
            setState(() {
              videosUrls.add(url);
              videoControllers
                  .add(VideoPlayerController.networkUrl(Uri.parse(url)));
            });
          }
        } else if (searchQuery is String) {
          final ref = firestore.ref().child('$searchQuery.mp4');
          final url = await ref.getDownloadURL();
          setState(() {
            videosUrls.add(url);
            videoControllers
                .add(VideoPlayerController.networkUrl(Uri.parse(url)));
          });
        }
      }
    } on Exception catch (e) {
      print('Exception with Firebase : ' + e.toString());
    }
  }

  // ذا انفض الناس عن غزة وملوا من أخبارها فلا تتخلى عنها حتى لو بقيت وحدك لازم تدعمها
  // print("Speech to Text output : " + speech2Text.translation.toString());
  // print("Speech to Text IDs : " + speechIds.toString());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        endDrawer: Drawer(
          width: 250.w,
          backgroundColor: kPrimaryColor,
          child: const DrawerBody(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextField(
                  controller: textEditingController,
                  onSubmit: getVideoUrls,
                ),
                videosUrls.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 300),
                        child: Center(
                          child: Text(
                            'تكلم معي',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          ),
                        ))
                    : Container(
                        clipBehavior: Clip.antiAlias,
                        padding: const EdgeInsets.only(bottom: 32),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: CarouselSlider.builder(
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height *
                                1.00000000005,
                            autoPlay: true,
                            reverse: true,
                            autoPlayInterval: const Duration(seconds: 22),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            viewportFraction: 1,
                            enableInfiniteScroll: true,
                          ),
                          itemCount: videosUrls.length,
                          itemBuilder: (context, index, realIndex) {
                            return VideoPlayerWidget(
                              controller: videoControllers[index],
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// DotsIndicator(
                //   dotsCount: videosUrls.length,
                //   position: 0,
                //   decorator: const DotsDecorator(
                //     color: Colors.black87, // Inactive color
                //     activeColor: Colors.redAccent,
                //   ),
                // ),
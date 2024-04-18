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
      Speech2Text speech2Text =
          await translate.translate(text: query, voiceRecord: "");
      print("Speech to Text output : " + speech2Text.translation.toString());
      final List<String> searchQueries = query.split(' ');
      for (String searchQuery in searchQueries) {
        final ref = firestore.ref().child('$searchQuery.mp4');
        final url = await ref.getDownloadURL();
        setState(() {
          videosUrls.add(url);
          videoControllers
              .add(VideoPlayerController.networkUrl(Uri.parse(url)));
        });
      }
    } on Exception catch (e) {
      print('Exception with Firebase : ' + e.toString());
    }
  }

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: videosUrls
                      .asMap()
                      .entries
                      .map(
                        (entry) => VideoPlayerWidget(
                          controller: videoControllers[entry.key],
                        ),
                      )
                      .toList(),
                ),
                CustomTextField(
                  controller: textEditingController,
                  onSubmit: getVideoUrls,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

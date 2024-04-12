import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sign_language_gp_app/constants.dart';
import 'package:sign_language_gp_app/widgets/custom_text_filed.dart';
import 'package:sign_language_gp_app/widgets/drawer_body.dart';

class LandingView extends StatefulWidget {
  LandingView({Key? key}) : super(key: key);
  static String id = 'landingView';
  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  final firestore = FirebaseStorage.instance;
  late List<String> imageUrls = [];
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      setState(() {
        imageUrls.clear();
      });
    });
  }

  Future<void> getImageUrls(String query) async {
    final List<String> searchQueries = query.split(' ');
    for (String searchQuery in searchQueries) {
      final ref = firestore.ref().child('$searchQuery.png');
      final url = await ref.getDownloadURL();
      setState(() {
        imageUrls.add(url);
      });
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
              children: [
                CustomTextField(
                  controller: textEditingController,
                  onSubmit: getImageUrls,
                ),
                Column(
                  children: imageUrls
                      .map(
                        (url) => Image.network(
                          url,
                          height: 600.h,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

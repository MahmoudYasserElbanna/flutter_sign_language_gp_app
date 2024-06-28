import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:record/record.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onSubmit;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late Record audioRecorder;
  late AudioPlayer audioPlayer;
  bool isRecording = false;
  String audioPath = '';

  void initState() {
    audioPlayer = AudioPlayer();
    audioRecorder = Record();
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    audioRecorder.dispose();
    super.dispose();
  }

  //ذا انفض الناس عن غزة وملوا من أخبارها فلا تتخلى عنها حتى لو بقيت وحدك لازم تدعمها
  Future<void> startRecording() async {
    try {
      if (await audioRecorder.hasPermission()) {
        await audioRecorder.start();
        setState(() {
          isRecording = true;
        });
      }
    } catch (e) {
      print('Error in Start Recording Function :$e');
    }
  }

  Future<void> stopRecording() async {
    try {
      String? path = await audioRecorder.stop();
      setState(() {
        isRecording = false;
        audioPath = path!;
      });
      //undo this if you finished the API
      // TODO send audio to api
    } catch (e) {
      print('error stop recording $e');
    }
  }

  Future<void> playRecording() async {
    try {
      Source urlSource = UrlSource(audioPath);
      await audioPlayer.play(urlSource);
    } catch (e) {
      print('can not play recording :  $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        controller: widget.controller,
        onSubmitted: widget.onSubmit,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          hintText: 'ادخل النص',
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.clipboard,
                ),
                onPressed: () {
                  playRecording();
                },
              ),
              SizedBox(
                height: 24.h,
                child: VerticalDivider(
                  width: 1,
                  color: Colors.grey.shade400,
                ),
              ),
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                ),
                onPressed: () {
                  widget.onSubmit(widget.controller.text);
                },
              ),
              SizedBox(
                height: 24.h,
                child: VerticalDivider(
                  width: 1,
                  color: Colors.grey.shade400,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    backgroundColor: Colors.transparent),
                onPressed: isRecording ? stopRecording : startRecording,
                child: isRecording
                    ? Icon(
                        Icons.mic_none,
                        color: Colors.black,
                        size: 24.h,
                      )
                    : Icon(
                        Icons.mic,
                        color: Colors.red,
                        size: 28.h,
                      ),
              ),
            ],
          ),
          suffixIcon: IconButton(
            icon: const Icon(
              FontAwesomeIcons.trash,
            ),
            onPressed: () {
              widget.controller.clear();
            },
          ),
        ),
      ),
    );
  }
}

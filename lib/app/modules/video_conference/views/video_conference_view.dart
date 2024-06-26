import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:video_conference/app/modules/video_conference/views/components/button_call.dart';
import 'package:video_conference/app/modules/video_conference/views/components/header_call.dart';
import 'package:video_conference/app/modules/video_conference/views/components/video_call.dart';
import 'package:video_conference/utils/spacing.dart';

import '../controllers/video_conference_controller.dart';

class VideoConferenceView extends GetView<VideoConferenceController> {
  const VideoConferenceView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoConferenceController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: Spacing.large),
            child: Column(
              children: [
                SizedBox(height: 4 * Spacing.large),
                HeaderCall(),
                Expanded(
                  child: VideoCall(),
                ),
                ButtonCall(),
              ],
            ),
          ),
        );
      },
    );
  }
}

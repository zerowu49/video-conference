import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_conference/app/modules/video_conference/controllers/video_conference_controller.dart';
import 'package:video_conference/app/modules/video_conference/views/components/people_card.dart';
import 'package:video_conference/app/modules/video_conference/views/components/screen_card.dart';
import 'package:video_conference/app/modules/video_conference/views/components/speaker_card.dart';
import 'package:video_conference/app/modules/video_conference/views/components/transcript_call.dart';
import 'package:video_conference/utils/index.dart';

class VideoCall extends StatelessWidget {
  const VideoCall({super.key});

  Widget imageWithName({
    required String name,
    required String urlProfile,
    bool isWaiting = false,
  }) {
    final imageBorderRadius = BorderRadius.circular(50);

    return LayoutBuilder(
      builder: (context, constraints) {
        const double maxImageHeight = 300;
        final double maxHeight = constraints.maxHeight < maxImageHeight
            ? constraints.maxHeight
            : maxImageHeight;
        print("maxHeight: $maxHeight");

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: MyBoldText.body1,
            ),
            const SizedBox(height: Spacing.large),
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: imageBorderRadius,
                  child: Image.network(
                    urlProfile,
                    fit: BoxFit.cover,
                    height: maxHeight * 0.7,
                    width: maxHeight * 0.4,
                  ),
                ),
                isWaiting
                    ? Positioned(
                        top: 0.0,
                        left: 0.0,
                        right: 0.0,
                        bottom: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: imageBorderRadius,
                            color: Colors.grey.withOpacity(0.6),
                          ),
                        ),
                      )
                    : const SizedBox(),
                isWaiting
                    ? Text(
                        "Waiting ...",
                        textAlign: TextAlign.center,
                        style:
                            MyRegularText.body1.copyWith(color: Colors.black),
                      )
                    : const SizedBox(),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoConferenceController>(
      builder: (controller) {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScreenCard(),
            SpeakerCard(),
            Expanded(
              child: PeopleCard(),
            ),
            SizedBox(height: Spacing.large),
            TranscriptCall(),
          ],
        );
      },
    );
  }
}

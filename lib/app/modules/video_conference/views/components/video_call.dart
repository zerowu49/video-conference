import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_conference/app/modules/video_conference/controllers/video_conference_controller.dart';
import 'package:video_conference/app/modules/video_conference/views/components/people_card.dart';
import 'package:video_conference/app/modules/video_conference/views/components/screen_card.dart';
import 'package:video_conference/app/modules/video_conference/views/components/speaker_card.dart';
import 'package:video_conference/app/modules/video_conference/views/components/transcript_call.dart';
import 'package:video_conference/app/modules/video_conference/views/video_conference_page.dart';
import 'package:video_conference/utils/index.dart';

class VideoCall extends StatelessWidget {
  final List<ParticipantTrack> participantTrack;

  const VideoCall({
    super.key,
    required this.participantTrack,
  });

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
        final List<ParticipantTrack> userScreenShare = participantTrack
            .where(
                (element) => element.type == ParticipantTrackType.kScreenShare)
            .toList();

        // Remove the identity that same like screenshare
        // since if the user screenshare, the participantTrack
        // will list them differently resulting into two data
        if (userScreenShare.isNotEmpty) {
          participantTrack.removeWhere((element) =>
              element.participant.identity ==
              userScreenShare.first.participant.identity);
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            userScreenShare.isNotEmpty
                ? ScreenCard(currentUser: userScreenShare.first)
                : const SizedBox.shrink(),
            userScreenShare.isNotEmpty
                ? SpeakerCard(currentUser: userScreenShare.first)
                : const SizedBox.shrink(),
            if (participantTrack.isNotEmpty)
              Expanded(
                child: PeopleCard(
                  participantTrack: participantTrack,
                ),
              ),
            const SizedBox(height: Spacing.large),
            const TranscriptCall(),
          ],
        );
      },
    );
  }
}

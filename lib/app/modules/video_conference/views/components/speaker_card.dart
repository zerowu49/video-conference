import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:video_conference/app/modules/video_conference/controllers/video_conference_controller.dart';
import 'package:video_conference/app/modules/video_conference/views/components/people_card.dart';
import 'package:video_conference/app/modules/video_conference/views/video_conference_page.dart';
import 'package:video_conference/utils/index.dart';

class SpeakerCard extends StatelessWidget {
  final ParticipantTrack currentUser;
  const SpeakerCard({
    super.key,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoConferenceController>(
      builder: (controller) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          child: Expanded(
            child: Container(
              padding: const EdgeInsets.all(Spacing.medium),
              child: PeopleImageCard(
                currentUser.participant as LocalParticipant,
                currentUser.type,
                urlProfile: controller.dataUser[0]['urlProfile'] as String,
              ),
            ),
          ),
        );
      },
    );
  }
}

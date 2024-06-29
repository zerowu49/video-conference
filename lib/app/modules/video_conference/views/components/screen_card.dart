import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:video_conference/app/modules/video_conference/controllers/video_conference_controller.dart';
import 'package:video_conference/app/modules/video_conference/views/components/people_card.dart';
import 'package:video_conference/app/modules/video_conference/views/video_conference_page.dart';
import 'package:video_conference/utils/index.dart';

class ScreenCard extends StatelessWidget {
  final ParticipantTrack currentUser;

  const ScreenCard({
    super.key,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoConferenceController>(
      builder: (controller) {
        final borderRadius = BorderRadius.circular(Spacing.large);
        return AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: borderRadius,
                      border: Border.all(
                        color: MyColor.primary,
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: borderRadius,
                      child: PeopleImageCard(
                        currentUser.participant as LocalParticipant,
                        currentUser.type,
                        urlProfile:
                            controller.dataUser[0]['urlProfile'] as String,
                        forShareScreen: true,
                      ),
                    ),
                    // child: Image.asset(
                    //   "asset/images/screen_example.png",
                    // ),
                  ),
                  Positioned(
                    top: Spacing.large,
                    right: Spacing.large,
                    child: CircleAvatar(
                      radius: Spacing.large,
                      backgroundColor: MyColor.darkButton,
                      child: IconButton(
                        icon: Image.asset(
                          "asset/images/ic_resize_full.png",
                        ),
                        iconSize: 24,
                        onPressed: () {
                          controller.changeShareScreenStatus(false);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Spacing.large),
            ],
          ),
        );
      },
    );
  }
}

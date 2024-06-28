import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_conference/app/modules/video_conference/controllers/video_conference_controller.dart';
import 'package:video_conference/utils/index.dart';

class ScreenCard extends StatelessWidget {
  const ScreenCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoConferenceController>(
      builder: (controller) {
        final isShareScreen = controller.isShareScreen.value;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          width: isShareScreen ? 900 : 0,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Spacing.large),
                child: Stack(
                  children: [
                    Image.asset("asset/images/screen_example.png"),
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
              ),
              const SizedBox(height: Spacing.large),
            ],
          ),
        );
      },
    );
  }
}

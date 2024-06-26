import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_conference/app/modules/video_conference/controllers/video_conference_controller.dart';
import 'package:video_conference/utils/spacing.dart';
import 'package:video_conference/utils/typography.dart';

class HeaderCall extends StatelessWidget {
  const HeaderCall({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoConferenceController>(
      builder: (controller) {
        final isMaximizeTranscript = controller.isMaximizeTranscript.value;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          height: isMaximizeTranscript ? 0 : 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset("asset/images/on_air.png"),
                  SizedBox(width: Spacing.large),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.roomName.value,
                        style: MyBoldText.body1,
                      ),
                      Text(
                        controller.roomTag.value,
                        style: MyMediumText.caption1,
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                tooltip: "Exit Room",
                onPressed: () {
                  Get.back();
                },
                icon: Image.asset("asset/images/ic_exit.png"),
              )
            ],
          ),
        );
      },
    );
  }
}

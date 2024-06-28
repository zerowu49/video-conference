import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_conference/app/modules/video_conference/controllers/video_conference_controller.dart';
import 'package:video_conference/utils/index.dart';

class TranscriptCall extends StatelessWidget {
  const TranscriptCall({super.key});

  final double widthImageChat = 40;

  Widget chatBox({
    required String name,
    required String urlProfile,
    required String chat,
  }) {
    final imageBorderRadius = BorderRadius.circular(50);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: imageBorderRadius,
          child: Image.network(
            urlProfile,
            fit: BoxFit.cover,
            height: 180 / 125 * widthImageChat,
            width: widthImageChat,
          ),
        ),
        const SizedBox(width: Spacing.large),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: MyBoldText.header4.copyWith(
                  color: MyColor.green,
                ),
              ),
              Text(
                chat,
                style: MyRegularText.header5,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoConferenceController>(
      builder: (controller) {
        final isTranscriptOpen = controller.isTranscriptOpen.value;
        final isMaximizeTranscript = controller.isMaximizeTranscript.value;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          height: !isTranscriptOpen
              ? 0
              : isMaximizeTranscript
                  ? Get.height * 0.5
                  : Get.height * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Spacing.large),
            color: MyColor.darkButton,
          ),
          child: Padding(
            padding: const EdgeInsets.all(Spacing.medium),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transcript",
                      style: MyRegularText.body1,
                    ),
                    IconButton(
                      onPressed: () {
                        controller.changeMaximizeTranscript(
                          isMaximizeTranscript ? false : true,
                        );
                      },
                      icon: Image.asset(
                        "asset/images/ic_resize_${isMaximizeTranscript ? "mini" : "full"}.png",
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        chatBox(
                          name: "Maria Lopez",
                          urlProfile:
                              "https://upload.wikimedia.org/wikipedia/commons/8/86/Woman_at_Lover%27s_Bridge_Tanjung_Sepat_%28cropped%29.jpg",
                          chat:
                              "How was the experience working in the live broadcast department on the Olympics? Must be nerve wrecking?",
                        ),
                        chatBox(
                          name: "Yaya Toure",
                          urlProfile:
                              "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                          chat:
                              "It was a good experience, I enjoyed my time there. How’s things back at the office?",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

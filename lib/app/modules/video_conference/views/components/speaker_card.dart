import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_conference/app/modules/video_conference/controllers/video_conference_controller.dart';
import 'package:video_conference/utils/index.dart';

class SpeakerCard extends StatelessWidget {
  const SpeakerCard({super.key});

  Widget imageWithName({
    required String name,
    required String urlProfile,
    bool isWaiting = false,
    bool isMultipleParticipant = false,
  }) {
    final imageBorderRadius = BorderRadius.circular(90);

    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxImageHeight = isMultipleParticipant ? 150 : 300;
        final double maxHeight = constraints.maxHeight < maxImageHeight
            ? constraints.maxHeight
            : maxImageHeight;

        return Container(
          width: isMultipleParticipant ? maxHeight * 0.5 : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: isMultipleParticipant
                ? [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: imageBorderRadius,
                          child: Image.network(
                            urlProfile,
                            fit: BoxFit.cover,
                            height: maxHeight * 0.7,
                            width: maxHeight * 0.5,
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
                                style: MyRegularText.body1
                                    .copyWith(color: Colors.black),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    const SizedBox(height: Spacing.large),
                    Text(
                      name,
                      style: MyBoldText.body1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ]
                : [
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
                            width: maxHeight * 0.5,
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
                                style: MyRegularText.body1
                                    .copyWith(color: Colors.black),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoConferenceController>(
      builder: (controller) {
        /// Speaker won't be highlighted when user is only 2
        if (controller.dataUser.length <= 2) {
          return const SizedBox();
        }

        final dataSpeaker = controller.dataUser[0];

        return AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          child: Expanded(
            child: Container(
              padding: const EdgeInsets.all(Spacing.medium),
              child: imageWithName(
                name: dataSpeaker['name'] as String,
                urlProfile: dataSpeaker['urlProfile'] as String,
              ),
            ),
          ),
        );
      },
    );
  }
}

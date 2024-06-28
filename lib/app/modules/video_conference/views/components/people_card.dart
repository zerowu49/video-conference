import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_conference/app/modules/video_conference/controllers/video_conference_controller.dart';
import 'package:video_conference/utils/index.dart';

class PeopleCard extends StatelessWidget {
  const PeopleCard({super.key});

  Widget imageWithName({
    required String name,
    required String urlProfile,
    bool isWaiting = false,
    bool isMultipleParticipant = false,
  }) {
    final imageBorderRadius = BorderRadius.circular(50);

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
                                "Waiting ..",
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
        final isMicOn = controller.isMicOn.value;
        final isShareScreen = controller.isShareScreen.value;

        final dataUserMap = controller.dataUser.asMap();

        return LayoutBuilder(
          builder: (_, constraints) {
            if (constraints.maxHeight < 100) {
              return SizedBox();
            }
            return AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              height: 0,
              child: Container(
                padding: const EdgeInsets.all(Spacing.medium),
                decoration: isShareScreen || controller.dataUser.length > 2
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(Spacing.large),
                        color: MyColor.darkButton,
                      )
                    : null,
                child: controller.dataUser.length <= 2
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              padding: const EdgeInsets.symmetric(
                                horizontal: Spacing.medium,
                              ),
                              child: Image.asset(
                                "asset/images/ic_talk_${isMicOn ? "on" : "off"}.png",
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: dataUserMap
                                  .map((i, e) {
                                    return MapEntry(
                                      i,
                                      Row(
                                        children: [
                                          imageWithName(
                                            name: e['name'] as String,
                                            urlProfile:
                                                e['urlProfile'] as String,
                                            isWaiting: e['isWaiting'] as bool,
                                          ),
                                          SizedBox(width: Spacing.medium),
                                        ],
                                      ),
                                    );
                                  })
                                  .values
                                  .toList(),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "asset/images/ic_talk_${isMicOn ? "on" : "off"}.png",
                                    color: MyColor.green,
                                    width: 20,
                                  ),
                                  SizedBox(width: Spacing.small),
                                  Text(
                                    "You & ${controller.dataUser.length - 1} participants",
                                    style: MyRegularText.body1.copyWith(
                                      color: MyColor.green,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  // controller.changeMaximizeTranscript(
                                  //   isMaximizeTranscript ? false : true,
                                  // );
                                },
                                icon: Image.asset(
                                  "asset/images/ic_resize_full.png",
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: dataUserMap
                                    .map((i, e) {
                                      return MapEntry(
                                        i,
                                        Row(
                                          children: [
                                            imageWithName(
                                              name: e['name'] as String,
                                              urlProfile:
                                                  e['urlProfile'] as String,
                                              isWaiting: e['isWaiting'] as bool,
                                              isMultipleParticipant: true,
                                            ),
                                            SizedBox(width: Spacing.medium),
                                          ],
                                        ),
                                      );
                                    })
                                    .values
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            );
          },
        );
      },
    );
  }
}

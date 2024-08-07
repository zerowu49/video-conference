import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_conference/app/modules/video_conference/controllers/video_conference_controller.dart';
import 'package:video_conference/utils/index.dart';

class ButtonCall extends StatelessWidget {
  const ButtonCall({
    super.key,
  });

  Widget chatBottomSheet() {
    return GetBuilder<VideoConferenceController>(
      builder: (controller) {
        return Wrap(
          children: [
            Container(
              padding: const EdgeInsets.only(
                bottom: Spacing.large,
                top: Spacing.small,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: Spacing.bottomSheetRadius,
              ),
              child: Column(
                children: [
                  // Drag Bar
                  Container(
                    height: Spacing.small,
                    width: Get.width * 0.1,
                    decoration: BoxDecoration(
                      color: MyColor.grey,
                      borderRadius: Spacing.allRadiusMedium,
                    ),
                  ),
                  const SizedBox(height: Spacing.medium),
                  // Message Threads
                  SizedBox(
                    height: Get.height * 0.3,
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      primary: false,
                      itemCount: controller.dataChat.length,
                      itemBuilder: (context, index) {
                        final currentChat = controller.dataChat[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Spacing.large,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ClipOval(
                                    child: Image.network(
                                      currentChat['imageUrl'] as String,
                                      fit: BoxFit.cover,
                                      width: 48,
                                      height: 48,
                                    ),
                                  ),
                                  const SizedBox(width: Spacing.medium),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              currentChat['name'] as String,
                                              style:
                                                  MyBoldText.header5.copyWith(
                                                color: MyColor.darkButton,
                                              ),
                                            ),
                                            Text(
                                              " • ${currentChat['time'] as String}",
                                              style:
                                                  MyBoldText.header5.copyWith(
                                                color: MyColor.darkButton,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          currentChat['chat'] as String,
                                          style: MyRegularText.header5.copyWith(
                                            color: MyColor.darkButton,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: MyColor.darkButton,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: Spacing.large,
                                ),
                                child: Text(
                                  "👍 + ${currentChat['like'] as int}",
                                  style: MyBoldText.header5.copyWith(
                                    color: MyColor.darkButton,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Spacing.large,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: Spacing.bottomSheetRadius,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 6.0,
                          blurRadius: 6.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Message Input
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: TextField(
                                controller: controller.chatTextController.value,
                                textInputAction: TextInputAction.send,
                                onChanged: (message) {
                                  controller.changeChatInput(message);
                                },
                                style: MyBoldText.body1.copyWith(
                                  color: MyColor.darkButton,
                                ),
                                decoration: InputDecoration(
                                  hintStyle: MyBoldText.body1.copyWith(
                                    color: MyColor.grey,
                                  ),
                                  hintText: "Write a message",
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                "asset/images/ic_resize_full.png",
                                color: MyColor.darkButton,
                              ),
                            ),
                          ],
                        ),

                        // Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "asset/images/ic_camera.png",
                                    color: MyColor.darkButton,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "asset/images/ic_image.png",
                                    color: MyColor.darkButton,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "asset/images/ic_transfer.png",
                                    color: MyColor.darkButton,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                controller.sendChat();
                              },
                              icon: controller.isSendingChat.value
                                  ? const CircularProgressIndicator(
                                      color: MyColor.primary,
                                      strokeWidth: 2,
                                    )
                                  : Image.asset(
                                      "asset/images/ic_send.png",
                                      color: MyColor.darkButton,
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
        final isMicOn = controller.isMicOn.value;
        final isVideoOn = controller.isVideoOn.value;
        final isTranscriptOpen = controller.isTranscriptOpen.value;
        final isChatOpen = controller.isChatOpen.value;
        final totalNewChat = controller.dataChat.length;
        final isReadChat = controller.isReadChat.value;

        final isScreenShare =
            controller.args.room.localParticipant!.isScreenShareEnabled();
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 2 * Spacing.large,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () =>
                    controller.changeMicStatus(isMicOn ? false : true),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: MyColor.darkButton,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (!isMicOn)
                      Transform(
                        alignment: Alignment.center,
                        transform:
                            Matrix4.rotationZ(45 * pi / 180), // 45 degree
                        child: Container(
                          color: Colors.red,
                          width: 2,
                          height: 30,
                        ),
                      ),
                    Icon(
                      Icons.mic_none,
                      color: !isMicOn ? Colors.grey : Colors.white,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () =>
                    controller.changeVideoStatus(isVideoOn ? false : true),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: MyColor.darkButton,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (!isVideoOn)
                      Transform(
                        alignment: Alignment.center,
                        transform:
                            Matrix4.rotationZ(45 * pi / 180), // 45 degree
                        child: Container(
                          color: Colors.red,
                          width: 2,
                          height: 30,
                        ),
                      ),
                    Icon(
                      Icons.videocam_outlined,
                      color: !isVideoOn ? Colors.grey : Colors.white,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => controller
                    .changeShareScreenStatus(isScreenShare ? false : true),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: MyColor.darkButton,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (!isScreenShare)
                      Transform(
                        alignment: Alignment.center,
                        transform:
                            Matrix4.rotationZ(45 * pi / 180), // 45 degree
                        child: Container(
                          color: Colors.red,
                          width: 2,
                          height: 30,
                        ),
                      ),
                    Icon(
                      Icons.monitor_outlined,
                      color: !isScreenShare ? Colors.grey : Colors.white,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller
                      .changeTranscriptStatus(isTranscriptOpen ? false : true);
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: isTranscriptOpen
                      ? MyColor.activeButton
                      : MyColor.darkButton,
                ),
                child: Text(
                  "T",
                  style: MyBoldText.body1.copyWith(
                    color: isTranscriptOpen ? Colors.black : Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.changeChatStatus(isChatOpen ? false : true);
                  controller.openChat(true);
                  Get.bottomSheet(
                    chatBottomSheet(),
                    isScrollControlled: true,
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: totalNewChat == 0 || isReadChat
                      ? MyColor.darkButton
                      : Colors.red,
                ),
                child: totalNewChat == 0 || isReadChat
                    ? Image.asset("asset/images/ic_pencil.png")
                    : Text(
                        totalNewChat.toString(),
                        style: MyBoldText.body1.copyWith(
                          color: Colors.white,
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

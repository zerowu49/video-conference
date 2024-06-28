import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:video_conference/app/modules/home/views/components/dialog.dart';
import 'package:video_conference/app/routes/app_pages.dart';
import 'package:video_conference/utils/index.dart';

class HomeController extends GetxController {
  static HomeController find() => Get.find();

  var usernameController = TextEditingController().obs;
  var choice = "".obs;
  var isJoining = false.obs;
  var loadingStatus = "".obs;

  void changeUsername(String username) {
    usernameController.value.text = username;
    update();
  }

  void resetVariableForFailedConnectingRoom() {
    loadingStatus.value = "";
    isJoining.value = false;
    update();
  }

  void setChoice(String choices) async {
    isJoining.value = true;
    update();

    // Show loading
    Get.dialog(
      HomeDialog(),
    );

    choice.value = choices;
    update();

    /// LiveKit Setting
    const roomOptions = RoomOptions(
      adaptiveStream: true,
      dynacast: true,
    );
    final room = Room();
    try {
      loadingStatus.value = "Connecting to room...";
      update();

      await room.connect(
        Const.livekitWebsocketUrl,
        Const.livekitAPIKey,
        roomOptions: roomOptions,
      );
    } catch (e) {
      // Close Dialog
      Get.back();
      // Show Toast
      Get.snackbar(
        'Failed to join room',
        e.toString(),
      );
      resetVariableForFailedConnectingRoom();
      return;
    }

    try {
      loadingStatus.value = "Checking for camera access...";
      update();

      // video will fail when running in ios simulator
      await room.localParticipant?.setCameraEnabled(true);
    } catch (e) {
      // Close Dialog
      Get.back();
      // Show Toast
      Get.snackbar(
        'Failed to get camera access',
        e.toString(),
      );
      resetVariableForFailedConnectingRoom();
      return;
    }
    await room.localParticipant?.setMicrophoneEnabled(true);

    // Redirect to next page
    Get.toNamed(Routes.VIDEO_CONFERENCE);
  }
}

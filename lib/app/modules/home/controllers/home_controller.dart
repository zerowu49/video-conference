import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_conference/app/routes/app_pages.dart';

class HomeController extends GetxController {
  static HomeController find() => Get.find();

  var usernameController = TextEditingController().obs;
  var choice = "".obs;

  void changeUsername(String username) {
    usernameController.value.text = username;
    update();
  }

  void setChoice(String choices) {
    choice.value = choices;
    update();

    // Redirect to next page
    Get.toNamed(Routes.VIDEO_CONFERENCE);
  }
}

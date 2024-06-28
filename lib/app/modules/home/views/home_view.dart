import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_conference/components/button/primary_button.dart';
import 'package:video_conference/utils/index.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: Spacing.paddingHorizontallarge,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: Spacing.paddingVerticalMedium,
                    child: Text(
                      "Username",
                      style: MyBoldText.header3,
                    ),
                  ),
                  TextField(
                    controller: controller.usernameController.value,
                    onChanged: (username) {
                      controller.changeUsername(username);
                    },
                    decoration: InputDecoration(
                      hintStyle: MyBoldText.header4,
                      hintText: 'Your username',
                      suffixIcon: controller.usernameController.value.text != ""
                          ? IconButton(
                              onPressed: () {
                                controller.changeUsername("");
                              },
                              icon: const Icon(
                                Icons.clear_outlined,
                                color: Colors.grey,
                              ),
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: Spacing.large),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          onPressed:
                              controller.usernameController.value.text != ""
                                  ? () {
                                      controller.setChoice("1-1");
                                    }
                                  : null,
                          text: "1-1",
                          isLoading: controller.isJoining.value,
                        ),
                      ),
                      const SizedBox(width: Spacing.large),
                      Expanded(
                        child: PrimaryButton(
                          onPressed:
                              controller.usernameController.value.text != ""
                                  ? () {
                                      controller.setChoice("Group");
                                    }
                                  : null,
                          text: "Group",
                          isLoading: controller.isJoining.value,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
          ],
        ),
      );
    });
  }
}

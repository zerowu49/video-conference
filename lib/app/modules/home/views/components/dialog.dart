import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_conference/app/modules/home/controllers/home_controller.dart';
import 'package:video_conference/utils/index.dart';

class HomeDialog extends StatelessWidget {
  const HomeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        String text = "Loading...";
        if (controller.loadingStatus.value != "") {
          text = controller.loadingStatus.value;
        }
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: Spacing.allRadiusMedium,
          ),
          child: Container(
            padding: Spacing.paddingAllMedium * 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(
                  color: MyColor.primary,
                ),
                const SizedBox(height: Spacing.large),
                Text(
                  text,
                  style: MyMediumText.header5.copyWith(
                    color: Colors.black,
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

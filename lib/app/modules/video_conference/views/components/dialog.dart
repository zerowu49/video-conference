import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_conference/components/button/primary_button.dart';
import 'package:video_conference/utils/index.dart';

Future<bool?> showPublishDialog() => Get.dialog(
      AlertDialog(
        title: const Text('Permission'),
        content: const Text(
          'Would you like to activate your Camera & Mic ?',
          style: MyRegularText.header5,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('NO'),
          ),
          PrimaryButton(
            onPressed: () => Get.back(result: true),
            text: "YES",
            isLoading: false,
            isNormalShape: true,
          ),
        ],
      ),
    );

Future<void> showErrorDialog(dynamic exception) => Get.dialog(
      AlertDialog(
        title: const Text('Error'),
        content: Text(
          exception.toString(),
          style: MyRegularText.header5,
        ),
        actions: [
          PrimaryButton(
            onPressed: () => Get.back(),
            text: "OK",
            isLoading: false,
            isNormalShape: true,
          ),
        ],
      ),
    );

Future<bool?> showDisconnectDialog() => Get.dialog(
      AlertDialog(
        title: const Text('Exit Room'),
        content: const Text(
          'Are you sure to leave the room?',
          style: MyRegularText.header5,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('Cancel'),
          ),
          PrimaryButton(
            onPressed: () => Get.back(result: true),
            text: "Leave",
            isLoading: false,
            isNormalShape: true,
          ),
        ],
      ),
    );

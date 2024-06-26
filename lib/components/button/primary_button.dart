import 'package:flutter/material.dart';
import 'package:video_conference/utils/colors.dart';
import 'package:video_conference/utils/spacing.dart';
import 'package:video_conference/utils/typography.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  const PrimaryButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColor.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Spacing.medium),
        ),
      ),
      child: Text(
        text,
        style: MyBoldText.body1,
      ),
    );
  }
}

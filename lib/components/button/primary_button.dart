import 'package:flutter/material.dart';
import 'package:video_conference/utils/index.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final bool isLoading;
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColor.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Spacing.medium),
          ),
        ),
        child: isLoading
            ? Container(
                padding: Spacing.paddingVerticalMedium,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Container(
                padding: Spacing.paddingVerticallarge,
                child: Text(
                  text,
                  style: MyBoldText.body1,
                ),
              ),
      ),
    );
  }
}

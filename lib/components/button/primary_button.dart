import 'package:flutter/material.dart';
import 'package:video_conference/utils/index.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final bool isLoading;
  final bool isNormalShape;
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.isLoading,
    this.isNormalShape = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColor.primary,
          foregroundColor: Colors.white,
          shape: isNormalShape
              ? null
              : RoundedRectangleBorder(
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
                padding: isNormalShape ? null : Spacing.paddingVerticallarge,
                child: Text(
                  text,
                  style: isNormalShape ? null : MyBoldText.body1,
                ),
              ),
      ),
    );
  }
}

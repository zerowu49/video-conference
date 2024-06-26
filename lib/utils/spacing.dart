import 'package:flutter/material.dart';

class Spacing {
  static const xs = 4.0;
  static const small = 8.0;
  static const medium = 12.0;
  static const large = 16.0;

  static const bottomSheetRadius = BorderRadius.vertical(
    top: Radius.circular(24),
  );

  static final allRadiusMedium = BorderRadius.circular(medium);

  static const paddingAllMedium = EdgeInsets.symmetric(
    vertical: medium,
    horizontal: medium,
  );
  static const paddingAllSmall = EdgeInsets.symmetric(
    vertical: small,
    horizontal: small,
  );

  static const paddingVerticallarge = EdgeInsets.symmetric(
    vertical: large,
  );
  static const paddingVerticalMedium = EdgeInsets.symmetric(
    vertical: medium,
  );

  static const paddingHorizontallarge = EdgeInsets.symmetric(
    horizontal: large,
  );
  static const paddingHorizontalMedium = EdgeInsets.symmetric(
    horizontal: medium,
  );
}

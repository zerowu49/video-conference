import 'package:flutter/material.dart';

class MyRegularText {
  static const TextStyle body1 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static const TextStyle body2 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 14,
  );

  static const TextStyle caption1 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 12,
  );

  static const TextStyle caption2 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 10,
  );

  static const TextStyle header1 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 50,
  );

  static const TextStyle header2 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 36,
  );

  static const TextStyle header3 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 28,
  );

  static const TextStyle header4 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 20,
  );
  static const TextStyle header5 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18,
  );
}

class MyMediumText {
  static const TextStyle body1 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const TextStyle body2 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static const TextStyle caption1 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  static const TextStyle caption2 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10,
  );

  static const TextStyle header1 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 50,
  );

  static const TextStyle header2 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 36,
  );

  static const TextStyle header3 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 28,
  );

  static const TextStyle header4 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );
  static const TextStyle header5 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );
}

class MyBoldText {
  static const TextStyle body1 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 16,
  );

  static const TextStyle body2 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 14,
  );

  static const TextStyle caption1 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 12,
  );

  static const TextStyle caption2 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 10,
  );

  static const TextStyle header1 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 50,
  );

  static const TextStyle header2 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 36,
  );

  static const TextStyle header3 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 28,
  );

  static const TextStyle header4 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 20,
  );
  static const TextStyle header5 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 18,
  );
}

extension TextStyling on TextStyle {
  TextStyle get black => copyWith(
        color: Colors.black,
      );
  TextStyle get white => copyWith(
        color: Colors.white,
      );
}

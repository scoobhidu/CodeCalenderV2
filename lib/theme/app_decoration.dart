import 'package:flutter/material.dart';
import 'package:codecalenderv2/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillIndigo600 => BoxDecoration(
        color: ColorConstant.indigo600,
      );
  static BoxDecoration get fillGreen600 => BoxDecoration(
        color: ColorConstant.green600,
      );
  static BoxDecoration get fillIndigo500 => BoxDecoration(
        color: ColorConstant.indigo500,
      );
  static BoxDecoration get outlineGray300cc => BoxDecoration(
        color: ColorConstant.indigo600,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.gray300Cc,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              4,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get glassMorphDesign => BoxDecoration(
        color: ColorConstant.whiteA700.withOpacity(0.01),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.gray300Cc,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              4,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get fillGray103 => BoxDecoration(
        color: ColorConstant.gray103,
      );
  static BoxDecoration get fillIndigo300 => BoxDecoration(
        color: ColorConstant.indigo300,
      );
  static BoxDecoration get fillGray102 => BoxDecoration(
        color: ColorConstant.gray102,
      );
  static BoxDecoration get fillGray101 => BoxDecoration(
        color: ColorConstant.gray101,
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: ColorConstant.gray100,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get gradientWhiteA70026WhiteA70026 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            -3.0616171314629196e-17,
          ),
          end: Alignment(
            0.5,
            0.9999999999999999,
          ),
          colors: [
            ColorConstant.whiteA70026,
            ColorConstant.whiteA70026,
          ],
        ),
      );
}

class BorderRadiusStyle {
  static BorderRadius customBorderBL15 = BorderRadius.only(
    bottomLeft: Radius.circular(
      getHorizontalSize(
        15.00,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        15.00,
      ),
    ),
  );

  static BorderRadius roundedBorder17 = BorderRadius.circular(
    getHorizontalSize(
      17.50,
    ),
  );

  static BorderRadius roundedBorder15 = BorderRadius.circular(
    getHorizontalSize(
      15.00,
    ),
  );

  static BorderRadius circleBorder25 = BorderRadius.circular(
    getHorizontalSize(
      25.00,
    ),
  );

  static BorderRadius roundedBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12.50,
    ),
  );

  static BorderRadius roundedBorder4 = BorderRadius.circular(
    getHorizontalSize(
      4.00,
    ),
  );

  static BorderRadius circleBorder85 = BorderRadius.circular(
    getHorizontalSize(
      85.00,
    ),
  );

  static BorderRadius circleBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20.00,
    ),
  );

  static BorderRadius roundedBorder30 = BorderRadius.circular(
    getHorizontalSize(
      30.00,
    ),
  );

  static BorderRadius roundedBorder9 = BorderRadius.circular(
    getHorizontalSize(
      9.50,
    ),
  );
}

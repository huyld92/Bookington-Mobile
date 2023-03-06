import 'package:flutter/material.dart';

import '../core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillGray500 => BoxDecoration(
        color: ColorConstant.gray500,
      );

  static BoxDecoration get fillRed50 => BoxDecoration(
        color: ColorConstant.red500,
      );

  static BoxDecoration get fillBlue50 => BoxDecoration(
        color: ColorConstant.blue50,
      );

  static BoxDecoration get fillGray50 => BoxDecoration(
        color: ColorConstant.gray50,
      );

  static BoxDecoration get fillBluegray50 => BoxDecoration(
        color: ColorConstant.blueGray50,
      );

  static BoxDecoration get fillBluegray900 => BoxDecoration(
        color: ColorConstant.blueGray900,
      );

  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );

  static BoxDecoration get fillGray300 => BoxDecoration(
        color: ColorConstant.gray300,
      );

  static BoxDecoration get fillGray200 => BoxDecoration(
        color: ColorConstant.gray200,
      );

  static BoxDecoration get gradientGray80000Gray90096 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            -0.5,
            0,
          ),
          end: Alignment(
            -0.5,
            1,
          ),
          colors: [
            ColorConstant.gray80000,
            ColorConstant.blueGray90059,
            ColorConstant.gray90096,
          ],
        ),
      );

  static BoxDecoration get outlineGray200 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.gray200,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );

  static BoxDecoration get outlineBluegray1000f => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.blueGray1000f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: const Offset(
              0,
              -8,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {
  static Border borderBlack2 = Border.all(color: Colors.black, width: 2);

  static Border border2Gray500 =
      Border.all(color: ColorConstant.gray500, width: 2);

  static Border borderB2Gray500 =
      Border(bottom: BorderSide(color: ColorConstant.gray500, width: 2));

  static Border border2Red500 =
      Border.all(color: ColorConstant.red500, width: 2);

  static Border borderGrayT1 =
      Border(top: BorderSide(color: ColorConstant.gray500, width: 1));

  static BorderRadius customBorderTL10 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        10.00,
      ),
    ),
    bottomLeft: Radius.circular(
      getHorizontalSize(
        10.00,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        10.00,
      ),
    ),
  );

  static BorderRadius customBorderTLR10 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        10.00,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        10.00,
      ),
    ),
  );

  static BorderRadius customBorderBLR10 = BorderRadius.only(
    bottomLeft: Radius.circular(
      getHorizontalSize(
        10.00,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        10.00,
      ),
    ),
  );

  static BorderRadius roundedBorder51 = BorderRadius.circular(
    getHorizontalSize(
      51.00,
    ),
  );

  static BorderRadius roundedBorder24 = BorderRadius.circular(
    getHorizontalSize(
      24.00,
    ),
  );

  static BorderRadius roundedBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20.00,
    ),
  );

  static BorderRadius roundedBorder16 = BorderRadius.circular(
    getHorizontalSize(
      16.00,
    ),
  );

  static BorderRadius roundedBorder10 = BorderRadius.circular(
    getHorizontalSize(
      10.00,
    ),
  );

  static BorderRadius roundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8.00,
    ),
  );

  static BorderRadius roundedBorder5 = BorderRadius.circular(
    getHorizontalSize(
      5.00,
    ),
  );

  static BorderRadius customBorderBL36 = BorderRadius.only(
    bottomLeft: Radius.circular(
      getHorizontalSize(
        36.00,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        36.00,
      ),
    ),
  );

  static BorderRadius circleBorder23 = BorderRadius.circular(
    getHorizontalSize(
      23.00,
    ),
  );

  static BorderRadius circleBorder5 = BorderRadius.circular(
    getHorizontalSize(
      5.00,
    ),
  );
}

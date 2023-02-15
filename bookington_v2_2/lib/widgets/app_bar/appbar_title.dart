import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';

// ignore: must_be_immutable
class AppbarTitle extends StatelessWidget {
  AppbarTitle({required this.text, this.margin, this.onTap});

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtManropeExtraBold18.copyWith(
            letterSpacing: getHorizontalSize(
              0.20,
            ),
            height: getVerticalSize(
              0.99,
            ),
            color: ColorConstant.gray900,
          ),
        ),
      ),
    );
  }
}

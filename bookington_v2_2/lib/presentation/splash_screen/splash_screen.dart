import 'package:bookington_v2_2/core/app_export.dart';

import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';

class SplashScreen extends GetWidget<SplashController> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.blueA400,
            body: Container(
                width: size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgLogo,
                          height: getVerticalSize(122.00),
                          width: getHorizontalSize(197.00),
                          margin: getMargin(top: 3))
                    ]))));
  }
}

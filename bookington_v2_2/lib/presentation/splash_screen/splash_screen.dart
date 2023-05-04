import 'package:bookington_v2_2/core/app_export.dart';

import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.blueA400,
            body: SizedBox(
                width: size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgLogo,
                          height: getVerticalSize(240.00),
                          width: getHorizontalSize(240.00),
                          margin: getMargin(top: 3))
                    ]))));
  }
}

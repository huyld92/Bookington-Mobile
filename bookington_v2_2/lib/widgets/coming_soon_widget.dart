import 'package:bookington_v2_2/core/app_export.dart';
import 'package:flutter/material.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: getPadding(bottom: 15),
              child: Text(
                "msg_is_coming_soon".tr,
                style: AppStyle.txtManropeBold32,
              ),
            ),
            CustomImageView(
              height: getVerticalSize(128),
              imagePath: ImageConstant.imagesComingSoon,
            ),
          ],
        ),
      ),
    );
  }
}

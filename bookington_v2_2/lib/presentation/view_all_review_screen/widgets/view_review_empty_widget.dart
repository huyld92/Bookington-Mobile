import 'package:bookington_v2_2/core/app_export.dart';
import 'package:flutter/material.dart';

class ViewReviewEmptyWidget extends StatelessWidget {
  const ViewReviewEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width,
        padding: getPadding(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: getPadding(bottom: 20),
              child: Text(
                "msg_get_your_first_review".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtManropeExtraBold20.copyWith(
                  letterSpacing: getHorizontalSize(0.20),
                  height: getVerticalSize(0.99),
                ),
              ),
            ),
            CustomImageView(
                svgPath: ImageConstant.imgCommentRating,
                height: getVerticalSize(200.00),
                width: getHorizontalSize(200.00)),
          ],
        ));
  }
}

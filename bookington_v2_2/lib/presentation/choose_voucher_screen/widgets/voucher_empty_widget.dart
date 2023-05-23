import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class VoucherEmptyWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width,
        padding: getPadding(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
                svgPath: ImageConstant.imgCoupon,
                height: getVerticalSize(200.00),
                width: getHorizontalSize(200.00)),
            Padding(
              padding: getPadding(bottom: 20),
              child: Text(
                "msg_you_don't_have_any_coupon_yet".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtManropeSemiBold20.copyWith(
                  letterSpacing: getHorizontalSize(0.20),
                  height: getVerticalSize(0.99),
                ),
              ),
            ),
          ],
        ));

  }

}
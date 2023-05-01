import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class OrderHistoryEmptyWidgets extends StatelessWidget{
  const OrderHistoryEmptyWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width,
        padding: getPadding(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImageView(
                svgPath: ImageConstant.imgNoResult,
                height: getVerticalSize(204.00),
                width: getHorizontalSize(255.00)),
            Padding(
                padding: getPadding(top: 20),
                child: Text("lbl_no_orders_yet".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtManropeExtraBold20Blue500.copyWith(
                        letterSpacing: getHorizontalSize(0.20),
                        height: getVerticalSize(0.99)))),
            Padding(
                padding: getPadding(top: 15),
                child: Text("msg_no_order_found".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtManropeSemiBold16.copyWith(
                        letterSpacing: getHorizontalSize(0.20),
                        height: getVerticalSize(0.99)))),
          ],
        ));

  }

}
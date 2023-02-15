import 'package:bookington_v2_2/presentation/payment_screen/controller/payment_controller.dart';

 import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class PaymentSuccessfulDialog extends StatelessWidget {
  PaymentSuccessfulDialog(this.controller);

  PaymentController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        all: 32,
      ),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomImageView(
            svgPath: ImageConstant.imgSuccess,
            height: getVerticalSize(
              180.00,
            ),
            width: getHorizontalSize(
              185.00,
            ),
            margin: getMargin(
              top: 8,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 34,
            ),
            child: Text(
              "lbl_payment_succesfull".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtManropeBold22Blue500,
            ),
          ),
          Container(
            width: getHorizontalSize(
              263.00,
            ),
            margin: getMargin(
              top: 14,
            ),
            child: Text(
              "msg_successfully".tr,
              maxLines: null,
              textAlign: TextAlign.center,
              style: AppStyle.txtManropeRegular18.copyWith(
                letterSpacing: getHorizontalSize(
                  0.20,
                ),
              ),
            ),
          ),
          CustomButton(
            height: 58,
            width: 276,
            text: "lbl_view_booking".tr,
            margin: getMargin(
              top: 29,
            ),
            variant: ButtonVariant.FillBlue500,
            onTap: () {
              print("View booking");
            },
          ),
        ],
      ),
    );
  }
}

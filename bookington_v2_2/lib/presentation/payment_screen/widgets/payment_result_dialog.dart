import 'package:bookington_v2_2/presentation/payment_screen/controller/payment_controller.dart';

import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';

 class PaymentResultDialog extends StatelessWidget {
  PaymentResultDialog(this.controller, {super.key});

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
          controller.isSuccess.value
              ? CustomImageView(
                  svgPath: ImageConstant.imgSuccess,
                  height: getVerticalSize(100.0),
                  width: getHorizontalSize(100.0),
                  margin: getMargin(top: 8),
                )
              : CustomImageView(
                  svgPath: ImageConstant.imgFailed,
                  height: getVerticalSize(100.0),
                  width: getHorizontalSize(100.0),
                  margin: getMargin(top: 8),
                ),
          controller.isSuccess.value
              ? Padding(
                  padding: getPadding(
                    top: 34,
                  ),
                  child: Text(
                    "lbl_payment_successful".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtManropeBold20Blue500,
                  ),
                )
              : Padding(
                  padding: getPadding(
                    top: 34,
                  ),
                  child: Text(
                    "lbl_payment_failed".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtManropeBold20Blue500,
                  ),
                ),
          //msg successful
          controller.isSuccess.value?
          Container(
            width: getHorizontalSize(
              263.00,
            ),
            margin: getMargin(
              top: 14,
            ),
            child: Text(
                "Payment for booking: courtName court",
                maxLines: 3,
                textAlign: TextAlign.center,
                style: AppStyle.txtManropeRegular18.copyWith(
                  letterSpacing: getHorizontalSize(
                    0.20,
                  ),
                ),
              ),
          ):
          Container(
            width: getHorizontalSize(
              263.00,
            ),
            margin: getMargin(
              top: 14,
            ),
            child: Text(
               "Payment for booking: courtName court",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: AppStyle.txtManropeRegular18.copyWith(
                letterSpacing: getHorizontalSize(
                  0.20,
                ),
              ),
            ),
          ),
          controller.isSuccess.value
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      height: 50,
                      width: 220,
                      text: "lbl_view_booking".tr,
                      margin: getMargin(left: 3.2, top: 29),
                      variant: ButtonVariant.FillBlue500,
                      fontStyle: ButtonFontStyle.ManropeBold14WhiteA700,
                      onTap: () {
                        controller.viewBooking();
                      },
                    ),
                    CustomButton(
                      height: 50,
                      width: 220,
                      text: "lbl_back_home".tr,
                      margin: getMargin(top: 10),
                      fontStyle: ButtonFontStyle.ManropeBold14,
                      variant: ButtonVariant.FillGray300,
                      onTap: () {
                        controller.getBackHome();
                        // print("Back home");
                      },
                    ),
                  ],
                )
              : CustomButton(
                  height: 50,
                  width: 220,
                  text: "lbl_cancel".tr,
                  margin: getMargin(top: 10),
                  fontStyle: ButtonFontStyle.ManropeBold14,
                  variant: ButtonVariant.FillGray300,
                  onTap: () {
                    controller.getBack();
                  },
                ),
        ],
      ),
    );
  }
}

import 'package:bookington_v2_2/presentation/profile_screen/controller/profile_controller.dart';

 import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class LogOutPopUpDialog extends StatelessWidget {
  LogOutPopUpDialog(this.controller);

  ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHorizontalSize(
        327,
      ),
      padding: getPadding(
        left: 27,
        top: 49,
        right: 27,
        bottom: 49,
      ),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder23,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            margin: getMargin(
              top: 2,
            ),
            color: ColorConstant.red50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusStyle.roundedBorder51,
            ),
            child: Container(
              height: getSize(
                103,
              ),
              width: getSize(
                103,
              ),
              padding: getPadding(
                all: 22,
              ),
              decoration: AppDecoration.fillGray50.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder51,
              ),
              child: Stack(
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgLogout,
                    height: getSize(
                      58,
                    ),
                    width: getSize(
                      58,
                    ),
                    alignment: Alignment.center,
                    color: ColorConstant.red500,

                  ),
                ],
              ),
            ),
          ),
          Container(
            width: getHorizontalSize(
              246,
            ),
            margin: getMargin(
              left: 13,
              top: 52,
              right: 13,
            ),
            child: Text(
              "msg_are_you_sure_to".tr,
              maxLines: null,
              textAlign: TextAlign.center,
              style: AppStyle.txtManropeBold20,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                onTap: () {
                  controller.logout(null);
                },
                height: getVerticalSize(
                  56,
                ),
                variant: ButtonVariant.FillRed500,
                fontStyle: ButtonFontStyle.ManropeBold16,
                width: getHorizontalSize(100),
                text: "lbl_logout".tr,
                margin: getMargin(
                  top: 27,
                ),
              ),
              CustomButton(
                onTap: () {
                  Get.back();
                },
                height: getVerticalSize(
                  56,
                ),
                variant: ButtonVariant.FillGray300,
                fontStyle: ButtonFontStyle.ManropeBold16,
                width: getHorizontalSize(100),
                text: "lbl_cancel".tr,
                margin: getMargin(
                  top: 27,
                ),
              ),

             ],
          )
        ],
      ),
    );
  }
}

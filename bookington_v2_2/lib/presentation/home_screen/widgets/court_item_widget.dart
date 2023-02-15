import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/home_screen/controller/home_controller.dart';
import 'package:bookington_v2_2/presentation/home_screen/models/home_item_model.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CourtItemWidget extends StatelessWidget {
  CourtItemWidget(this.homeItemModelObj);

  HomeItemModel homeItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: getVerticalSize(
            400.00,
          ),
          width: getHorizontalSize(
            300.00,
          ),
          margin: getMargin(
            right: 24,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgPhoThoCourt,
                height: getVerticalSize(
                  400.00,
                ),
                width: getHorizontalSize(
                  300.00,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    36.00,
                  ),
                ),
                alignment: Alignment.center,
                onTap: () {
                  print("court details");
  controller.goCourtDetails();
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: getHorizontalSize(
                        300.00,
                      ),
                      margin: getMargin(
                        top: 172,
                      ),
                      padding: getPadding(
                        left: 32,
                        top: 23,
                        right: 32,
                        bottom: 23,
                      ),
                      decoration:
                          AppDecoration.gradientGray80000Gray90096.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderBL36,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: getPadding(
                              top: 19,
                            ),
                            child: Text(
                              "Phu Tho Court".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtManropeExtraBold24WhiteA700.copyWith(
                                height: getVerticalSize(
                                  1.00,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 10,
                            ),
                            child: Text(
                              "District 11, HCM city".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtManropeMedium14Gray300
                                  .copyWith(
                                letterSpacing: getHorizontalSize(
                                  0.20,
                                ),
                                height: getVerticalSize(
                                  1.17,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 8,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "100.000 VND".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtManropeExtraBold24WhiteA700.copyWith(
                                    height: getVerticalSize(
                                      1.00,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 4,
                                    top: 9,
                                    bottom: 2,
                                  ),
                                  child: Text(
                                    "slot/30min".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtManropeExtraBold14Gray300
                                        .copyWith(
                                      letterSpacing: getHorizontalSize(
                                        0.20,
                                      ),
                                      height: getVerticalSize(
                                        1.17,
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

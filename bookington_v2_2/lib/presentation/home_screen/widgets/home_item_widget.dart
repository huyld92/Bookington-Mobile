import '../controller/home_controller.dart';
import '../models/home_item_model.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class HomeItemWidget extends StatelessWidget {
  HomeItemWidget(this.homeItemModelObj);

  HomeItemModel homeItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(
        400.00,
      ),
      width: getHorizontalSize(
        327.00,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgPhoThoCourt,
            height: getVerticalSize(
              418.00,
            ),
            width: getHorizontalSize(
              327.00,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                10.00,
              ),
            ),
            alignment: Alignment.center,
            onTap: () {
              print("court details");
              // Navigator.pushNamed(context, AppRoutes.courtDetailsScreen);
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: getPadding(
                left: 16,
                right: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomIconButton(
                    height: 36,
                    width: 36,
                    variant: IconButtonVariant.OutlineBluegray50,
                    padding: IconButtonPadding.PaddingAll6,
                    child: CustomImageView(
                      svgPath: ImageConstant.imgFavorite,
                    ),
                    onTap: () {
                      print("Like Court");
                    },
                  ),
                  Container(
                    margin: getMargin(
                      top: 248,
                    ),
                    padding: getPadding(
                      top: 14,
                      bottom: 14,
                    ),
                    decoration: AppDecoration.fillGray50.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 1,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Phu Tho Court",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtManropeExtraBold18.copyWith(
                                  letterSpacing: getHorizontalSize(
                                    0.20,
                                  ),
                                  height: getVerticalSize(
                                    0.99,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 8,
                                ),
                                child: Row(
                                  children: [
                                    CustomImageView(
                                      svgPath: ImageConstant.imgLocationBlue,
                                      height: getSize(
                                        14.00,
                                      ),
                                      width: getSize(
                                        14.00,
                                      ),
                                      margin: getMargin(
                                        bottom: 2,
                                      ),

                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 4,
                                      ),
                                      child: Text(
                                        "District 11, HCM city",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtManropeRegular12
                                            .copyWith(
                                          letterSpacing: getHorizontalSize(
                                            0.40,
                                          ),
                                          height: getVerticalSize(
                                            1.10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 1,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "2\$",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtManropeExtraBold18Blue500
                                    .copyWith(
                                  letterSpacing: getHorizontalSize(
                                    0.20,
                                  ),
                                  height: getVerticalSize(
                                    0.99,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 9,
                                ),
                                child: Text(
                                  "per slot (30min)",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtManropeRegular12.copyWith(
                                    letterSpacing: getHorizontalSize(
                                      0.40,
                                    ),
                                    height: getVerticalSize(
                                      1.10,
                                    ),
                                  ),
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
        ],
      ),
    );
  }
}

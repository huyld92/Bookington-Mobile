import '../controller/recommend_controller.dart';
import '../models/recommend_item_model.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';

// ignore: must_be_immutable
class RecommendItemWidget extends StatelessWidget {
  RecommendItemWidget(this.recommendItemModelObj);

  RecommendItemModel recommendItemModelObj;

  var controller = Get.find<RecommendController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 19,
        top: 10,
        right: 19,
        bottom: 20,
      ),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: recommendItemModelObj.courtImage.image_binary,
            height: getVerticalSize(
              120.00,
            ),
            width: getHorizontalSize(
              150.00,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                16.00,
              ),
            ),
          ),
          Container(
            width: getHorizontalSize(
              150.00,
            ),
            margin: getMargin(
              left: 1,
              top: 10,
            ),
            child: Text(
              "recommendItemModelObj.court.name",
              maxLines: null,
              textAlign: TextAlign.left,
              style: AppStyle.txtManropeBold16,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 1,
              top: 9,
            ),
            child: Row(
              children: [
                CustomImageView(
                  svgPath: ImageConstant.imgStar,
                  height: getSize(
                    12.00,
                  ),
                  width: getSize(
                    12.00,
                  ),
                  margin: getMargin(
                    top: 2,
                    bottom: 2,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 4,
                  ),
                  child: Text(
                    recommendItemModelObj.rating,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtManropeSemiBold14.copyWith(
                      letterSpacing: getHorizontalSize(
                        0.20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 8,
                    top: 1,
                  ),
                  child: Text(
                    "recommendItemModelObj.court.address",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtManropeRegular12.copyWith(
                      letterSpacing: getHorizontalSize(
                        0.20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              left: 1,
              top: 9,
            ),
            child: Row(
              children: [
                Text(
                  "5\$".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtManropeBold16,
                ),
                Padding(
                  padding: getPadding(
                    left: 4,
                    top: 10,
                    bottom: 2,
                  ),
                  child: Text(
                    "lbl_slot".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtManropeRegular12.copyWith(
                      letterSpacing: getHorizontalSize(
                        0.20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              left: 1,
              top: 9,
            ),
            child: Text(
              "Court: 10".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtManropeBold12,
            ),
          ),
        ],
      ),
    );
  }
}

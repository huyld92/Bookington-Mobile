import '../controller/court_details_controller.dart';
import '../models/listfive_item_model.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';

// ignore: must_be_immutable
class ListRatingItemWidget extends StatelessWidget {
  ListRatingItemWidget(this.listRatingItemModelObj, {super.key});

  ListfiveItemModel listRatingItemModelObj;

  var controller = Get.find<CourtDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "5",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtManropeBold14.copyWith(
            letterSpacing: getHorizontalSize(
              0.20,
            ),
            height: getVerticalSize(
              1.10,
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 7,
            top: 4,
            bottom: 7,
          ),
          child: Container(
            height: getVerticalSize(
              8.00,
            ),
            width: getHorizontalSize(
              257.00,
            ),
            decoration: BoxDecoration(
              color: ColorConstant.gray300,
              borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  1.00,
                ),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  1.00,
                ),
              ),
              child: LinearProgressIndicator(
                value: 0.4,
                backgroundColor: ColorConstant.gray300,
                valueColor: AlwaysStoppedAnimation<Color>(
                  ColorConstant.yellow700,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 12,
            bottom: 1,
          ),
          child: Text(
            "lbl_60".tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtManropeRegular14.copyWith(
              height: getVerticalSize(
                1.14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

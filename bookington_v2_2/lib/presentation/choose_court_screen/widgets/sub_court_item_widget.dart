

import 'package:bookington_v2_2/core/constants/color_constant.dart';
import 'package:bookington_v2_2/core/constants/image_constant.dart';
import 'package:bookington_v2_2/core/utils/size_utils.dart';

import 'package:bookington_v2_2/presentation/choose_court_screen/controller/choose_court_controller.dart';
import 'package:bookington_v2_2/widgets/custom_icon_button.dart';
import 'package:bookington_v2_2/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SubCourtItemWidget extends StatelessWidget {
  SubCourtItemWidget(this.index, {super.key});

   int index;

  var controller = Get.find<ChooseCourtController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: getPadding(
          left: 5,
          top: 5,
          right: 5,
          bottom: 5,
        ),
        height: double.infinity,
        child:Obx(() =>   Column(
          // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               CustomIconButton(
                height: 64,
                width: 64,
                margin: getMargin(
                  top: 2,
                  bottom: 2,
                ),
                // variant: controller.subCourtModelObj.recommendItemList[index].is_active ?
                // IconButtonVariant.OutlineBlack900:
                // IconButtonVariant.OutlineBluegray50,
                child: CustomImageView(
                  svgPath: ImageConstant.imgBadmintonCourt,
                  color: controller.subCourtList[index-1].isAvailable
                      ? (controller.subCourtList[index-1].isSelected ? ColorConstant.blue500:ColorConstant.black900)
                      : ColorConstant.gray500,
                ),
                onTap: () {
                  if (controller.subCourtList[index-1].isAvailable) {
                     controller.selectCourt(index-1);
                  }

                },
              ),
              Text(
                "Court $index",
                style: TextStyle(
                    color: controller.subCourtList[index-1].isAvailable
                        ? (controller.subCourtList[index-1].isSelected ? ColorConstant.blue500:ColorConstant.black900)
                        : ColorConstant.gray500),
              ),
            ]),),
    );
  }
}

import 'package:bookington_v2_2/core/utils/color_constant.dart';
import 'package:bookington_v2_2/core/utils/image_constant.dart';
import 'package:bookington_v2_2/core/utils/size_utils.dart';
import 'package:bookington_v2_2/theme/app_decoration.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:get/get.dart';

import 'controller/recommend_controller.dart';
import 'models/recommend_item_model.dart';
import 'package:flutter/material.dart';

import 'widgets/recommend_item_widget.dart';

class RecommendScreen extends GetWidget<RecommendController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.gray300,
            appBar: CustomAppBar(
              height: getVerticalSize(51.00),
              leadingWidth: 52,
              leading: AppbarImage(
                  height: getSize(28.00),
                  width: getSize(28.00),
                  svgPath: ImageConstant.imgArrowleft,
                  margin: getMargin(left: 24, top: 10, bottom: 13),
                  onTap: onTapArrowleft),
              title: AppbarTitle(
                  text: "lbl_recommend".tr, margin: getMargin(left: 16)),
            ),
            body: Container(
                margin: getMargin(left: 24, top: 20, right: 24, bottom: 20),
                decoration: AppDecoration.fillGray300,
                child: Obx(() => GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: getVerticalSize(290.00),
                        crossAxisCount: 2,
                        mainAxisSpacing: getHorizontalSize(15.00),
                        crossAxisSpacing: getHorizontalSize(15.00)),
                    itemCount: controller.recommendModelObj.value.recommendItemList.length,
                    itemBuilder: (context, index) {
                      RecommendItemModel model = controller.recommendModelObj.value.recommendItemList[index];
                      return RecommendItemWidget(model);
                    })))));
  }

  onTapArrowleft() {
    print("back recommend screen");
    // Get.back();
  }
}

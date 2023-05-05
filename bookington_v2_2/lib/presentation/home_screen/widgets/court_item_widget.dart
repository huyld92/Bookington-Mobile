// ignore_for_file: avoid_print

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/home_screen/controller/home_controller.dart';
import 'package:bookington_v2_2/presentation/home_screen/models/home_court_item_model.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeCourtItemWidget extends StatelessWidget {
  HomeCourtItemWidget(this.model, this.index, {super.key});

  HomeCourtItemModel model;
  int index;
  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: getVerticalSize(400.00),
          width: getHorizontalSize(300.00),
          margin: getMargin(right: 24),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              if (model.listCourtImage.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    controller.courtDetailsScreen(index);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(36.00),
                    ),
                    child: Image.memory(
                      model.listCourtImage[0].imgBase,
                      height: getVerticalSize(400.00),
                      width: getHorizontalSize(300.00),
                      fit: BoxFit.cover,
                    ),

                  ),
                )
              else
                CustomImageView(
                  imagePath: ImageConstant.imagesPhoThoCourt,
                  // imagePath: ImageConstant.imgNoPhoto,
                  height: getVerticalSize(400.00),
                  width: getHorizontalSize(300.00),
                  radius: BorderRadius.circular(
                    getHorizontalSize(36.00),
                  ),
                  alignment: Alignment.center,
                  onTap: () {
                    controller.courtDetailsScreen(index);
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
                      width: getHorizontalSize(300.00),
                      margin: getMargin(top: 172),
                      padding:
                          getPadding(left: 32, top: 23, right: 32, bottom: 23),
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
                            padding: getPadding(top: 19),
                            child: Text(
                              model.name,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtManropeExtraBold24WhiteA700
                              // style: AppStyle.txtManropeExtraBold24
                                  .copyWith(
                                height: getVerticalSize(1.00),
                              ),
                              maxLines: 3,
                              softWrap: true,
                            ),
                          ),
                          Padding(
                            padding: getPadding(top: 10),
                            child: Text(
                              "${model.districtName},${model.provinceName}",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style:
                                  AppStyle.txtManropeMedium14Gray300.copyWith(
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
                            padding: getPadding(top: 8),
                            child: Row(
                              children: [
                                Text(
                                  model.moneyPerHour,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtManropeExtraBold20WhiteA700
                                      .copyWith(
                                    height: getVerticalSize(1.00),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 4,
                                    top: 9,
                                    bottom: 2,
                                  ),
                                  child: Text(
                                    "lbl_slot_30_min".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtManropeExtraBold14Gray300
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
                                const Spacer(),
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


// ignore: must_be_immutable
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/search_page/controller/search_controller.dart';
import 'package:flutter/material.dart';

class SearchEmptyWidget extends StatelessWidget {

  SearchController controller = Get.find();

  SearchEmptyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return  Container(
          width: size.width,
          padding: getPadding(top:20,left: 41, right: 41),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: getPadding(
                    top: 20,
                    right: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: getPadding(
                          left: 10,
                          bottom: 5,
                        ),
                        child: Text(
                          "${"lbl_result".tr}(${controller.totalCourt.value})",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtManropeBold18,
                        ),
                      ),
                      CustomImageView(
                        margin: getMargin(right: 10, bottom: 5),
                        svgPath: ImageConstant.imgFilter,
                        height: getSize(
                          28.00,
                        ),
                        width: getSize(
                          28.00,
                        ),
                        onTap: () {
                          controller.filterDialog();
                        },
                      ),
                    ],
                  ),),

                CustomImageView(
                    imagePath: ImageConstant.imgPlayer,
                    height: getVerticalSize(204.00),
                    width: getHorizontalSize(255.00)),
                Padding(
                    padding: getPadding(top: 31),
                    child: Text("lbl_no_results".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtManropeExtraBold20Gray900
                            .copyWith(
                            letterSpacing: getHorizontalSize(0.20),
                            height: getVerticalSize(0.99)))),
                Container(
                    width: getHorizontalSize(292.00),
                    margin: getMargin(top: 9),
                    child: Text("msg_empty_search".tr,
                        maxLines: null,
                        textAlign: TextAlign.center,
                        style: AppStyle.txtManropeRegular16.copyWith(
                            letterSpacing: getHorizontalSize(0.30),
                            height: getVerticalSize(1.10)))),

              ])
    );
  }
}
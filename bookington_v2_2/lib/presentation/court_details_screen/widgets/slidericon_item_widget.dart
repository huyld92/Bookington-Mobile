import '../controller/court_details_controller.dart';
import '../models/slidericon_item_model.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';

// ignore: must_be_immutable
class SlidericonItemWidget extends StatelessWidget {
  SlidericonItemWidget(this.slidericonItemModelObj, {super.key});

  SlidericonItemModel slidericonItemModelObj;

  var controller = Get.find<CourtDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: getVerticalSize(343.00),
        width: getHorizontalSize(343.00),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imagesPhoThoCourt,
              height: getSize(343.00),
              width: getSize(343.00),
              radius: BorderRadius.circular(
                getHorizontalSize(
                  20.00,
                ),
              ),
              alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: getPadding(left: 24, top: 24, right: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        bottom: 1,
                      ),
                      child: Obx(
                        () => Text(
                          controller.courtDetailsModelObj.value.name,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style:
                              AppStyle.txtManropeExtraBold24WhiteA700.copyWith(
                            height: getVerticalSize(
                              0.95,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        bottom: 40,
                      ),
                      child: Obx(
                        () => Text(
                          "${controller.courtDetailsModelObj.value.address}, ${controller.courtDetailsModelObj.value.districtName}",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtManropeMedium14Gray300.copyWith(
                            height: getVerticalSize(
                              1.10,
                            ),
                          ),
                          softWrap: true,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

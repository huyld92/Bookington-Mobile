import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/notification_screen/controller/notification_controller.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class NotificationEmptyWidget extends StatelessWidget {
  NotificationEmptyWidget({super.key});

  NotificationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: CustomAppBar(
          height: getVerticalSize(80),
          leadingWidth: getHorizontalSize(64),
          leading: AppbarImage(
            height: getVerticalSize(64),
            width: getVerticalSize(64),
            svgPath: ImageConstant.imgArrowLeft,
            margin: getMargin(left: 24),
            onTap: () {
              controller.getBack();
            },
          ),
          centerTitle: true,
          title: AppbarTitle(text: "lbl_notification".tr),
          actions: [
            Padding(
                padding: getPadding(left: 20, top: 25, right: 20, bottom: 17),
                child: CustomImageView(
                  svgPath: ImageConstant.imgReadAll,
                ))
          ]),
      body: Container(
          width: size.width,
           padding: getPadding(top: 100),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                  svgPath: ImageConstant.imgNotifyEmpty,
                  height: getVerticalSize(204.00),
                  width: getHorizontalSize(255.00)),
              Padding(
                  padding: getPadding(top: 31),
                  child: Text("lbl_no_notification".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtManropeExtraBold20Gray900.copyWith(
                          letterSpacing: getHorizontalSize(0.20),
                          height: getVerticalSize(0.99)))),

            ],
          )),
    );
  }
}

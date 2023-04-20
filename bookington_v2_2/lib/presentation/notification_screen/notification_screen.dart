import 'package:bookington_v2_2/data/models/notification_model.dart';
import 'package:bookington_v2_2/presentation/notification_screen/widgets/notification%20_empty_widget.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/loading_widget.dart';

import '../notification_screen/widgets/notification_item_widget.dart';
import 'controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';

// ignore: must_be_immutable
class NotificationScreen extends GetWidget<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(80),
                leadingWidth: 64,
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
                      padding:
                          getPadding(left: 20, top: 25, right: 20, bottom: 17),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgReadAll,
                      ))
                ]),
            body: Container(
              height: getVerticalSize(700),
              padding: getPadding(top: 10),
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  controller: controller.scroll,
                  itemCount: controller.listNotificationModel.length,
                  itemBuilder: (context, index) {
                    NotificationModel model =
                        controller.listNotificationModel[index];
                    return NotificationItemWidget(model, index);
                  },
                ),
              ),
            ),
          ),
        );
      },
      onLoading: const LoadingWidget(),
      onEmpty: NotificationEmptyWidget(),
    );
  }
}

import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';

import '../notification_screen/widgets/notification_item_widget.dart';
import 'controller/notification_controller.dart';
import 'models/notification_item_model.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';
 import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';

// ignore: must_be_immutable
class NotificationScreen extends GetWidget<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(80),
                leadingWidth: 64,
                leading: AppbarImage(
                  height: getVerticalSize(64),
                  width: getVerticalSize(64),
                  svgPath: ImageConstant.imgArrowleft,
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
                      child: Text("lbl_clear_all".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtManropeSemiBold16Blue500))
                ]),
            body: Padding(
                padding: getPadding(top: 22),
                child: Obx(() => ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(16));
                    },
                    itemCount: controller
                        .notificationModelObj.value.notificationItemList.length,
                    itemBuilder: (context, index) {
                      NotificationItemModel model = controller
                          .notificationModelObj
                          .value
                          .notificationItemList[index];
                      return NotificationItemWidget(model);
                    },),),),),);
  }
}

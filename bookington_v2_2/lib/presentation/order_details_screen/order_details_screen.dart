import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/order_details_screen/controller/order_details_controller.dart';
import 'package:bookington_v2_2/presentation/order_history_screen/models/booking_order_history_model.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:bookington_v2_2/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetailsScreen extends GetWidget<OrderDetailsController> {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Scaffold(
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
                title: AppbarTitle(text: "lbl_order_details".tr),
              ),
              body: Container(
                padding: getPadding(all: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Padding(
                        padding: getPadding(right: 20),
                        child: Text(
                          "Status:",
                          style: AppStyle.txtManropeBold16,
                        ),
                      ),
                      if (controller.orderHistory.value.isRefunded)
                        Obx(
                          () => Container(
                              padding: getPadding(all: 5),
                              decoration: BoxDecoration(
                                  color:
                                      controller.orderHistory.value.isRefunded
                                          ? ColorConstant.red500
                                          : ColorConstant.red500,
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder10),
                              child: Text("lbl_refunded".tr,
                                  style:
                                      AppStyle.txtManropeSemiBold16whiteA700)),
                        )
                      else if (controller.orderHistory.value.isCanceled)
                        Obx(() => Container(
                            padding: getPadding(all: 5),
                            decoration: BoxDecoration(
                                color: controller.orderHistory.value.isCanceled
                                    ? ColorConstant.yellow700
                                    : ColorConstant.yellow700,
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder10),
                            child: Text("lbl_cancelled".tr,
                                style: AppStyle.txtManropeSemiBold16whiteA700)))
                      else if (controller.orderHistory.value.isPaid)
                        Obx(() => Container(
                            padding: getPadding(all: 5),
                            decoration: BoxDecoration(
                                color: controller.orderHistory.value.isPaid
                                    ? ColorConstant.green500
                                    : ColorConstant.green500,
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder10),
                            child: Text("lbl_paid".tr,
                                style: AppStyle.txtManropeSemiBold16whiteA700)))
                      else
                        Container(
                            padding: getPadding(all: 5),
                            decoration: BoxDecoration(
                                color: ColorConstant.red500,
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder10),
                            child: Text("lbl_not_yet".tr,
                                style: AppStyle.txtManropeSemiBold16whiteA700))
                    ]),
                    Padding(
                      padding: getPadding(bottom: 10, top: 10),
                      child: Text(
                        'Order ${controller.orderHistory.value.id}',
                        style: AppStyle.txtManropeBold16,
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ),
                    Padding(
                      padding: getPadding(bottom: 10),
                      child: Text(
                        'Order Date: ${controller.orderHistory.value.orderDate}  ${controller.orderHistory.value.orderTime}',
                        style: AppStyle.txtManropeBold16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(bottom: 10),
                          child: Text(
                            "Court: ${controller.orderHistory.value.courtName}",
                            style: AppStyle.txtManropeBold16,
                            softWrap: true,
                          maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // SvgPicture.asset('assets/icons/price.svg'),
                        Padding(
                          padding: getPadding(bottom: 10),
                          child: Text(
                            'Order Price: ${controller.orderHistory.value.totalPrice} đ',
                            style: AppStyle.txtManropeBold16,
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => Container(
                        padding: getPadding(all: 10),
                        decoration: BoxDecoration(
                            border: BorderRadiusStyle.borderBlack2),
                        child: Column(
                          children: [
                            Text(
                              "Play date: ${DateFormat("dd-MM-yyyy").format(controller.orderHistory.value.bookings[0].playDate)}",
                              style: AppStyle.txtManropeBold16,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  controller.orderHistory.value.bookings.length,
                              itemBuilder: (context, index) {
                                BookingOrderHistoryModel model = controller
                                    .orderHistory.value.bookings[index];
                                return Container(
                                  padding: getPadding(top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Slot: ${DateFormat("kk:mm").format(model.startTime)}-${DateFormat("kk:mm").format(model.endTime)}",
                                        style: AppStyle.txtManropeBold16,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (controller.orderHistory.value.canBeCanceled &&
                        !controller.orderHistory.value.isCanceled &&
                        controller.orderHistory.value.isPaid)
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: controller.orderHistory.value.isCanceled
                                  ? getMargin(top: 10)
                                  : getMargin(top: 10),
                              child: CustomButton(
                                height: getVerticalSize(55),
                                width: getHorizontalSize(300),
                                variant: ButtonVariant.FillRed500,
                                fontStyle:
                                    ButtonFontStyle.ManropeBold14WhiteA700,
                                text: "lbl_cancel".tr,
                                onTap: () {
                                  Get.defaultDialog(
                                    title: "msg_cancel_order".tr,
                                    content: Text("msg_are_you_sure".tr),
                                    barrierDismissible: false,
                                    cancel: CustomButton(
                                      padding: ButtonPadding.PaddingAll0,
                                      height: getVerticalSize(40),
                                      width: getHorizontalSize(80),
                                      fontStyle: ButtonFontStyle
                                          .ManropeBold14WhiteA700,
                                      variant: ButtonVariant.FillGray500,
                                      text: "lbl_no".tr,
                                      onTap: () {
                                        controller.getBack();
                                      },
                                    ),
                                    confirm: CustomButton(
                                      padding: ButtonPadding.PaddingAll0,
                                      height: getVerticalSize(40),
                                      width: getHorizontalSize(80),
                                      fontStyle: ButtonFontStyle
                                          .ManropeBold14WhiteA700,
                                      text: "lbl_yes".tr,
                                      onTap: () {
                                        controller.cancelOrder();
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
        onLoading: const LoadingWidget());
  }
}

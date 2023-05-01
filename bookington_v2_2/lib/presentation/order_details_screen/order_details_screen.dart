import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/order_details_screen/controller/order_details_controller.dart';
import 'package:bookington_v2_2/presentation/order_history_screen/models/booking_order_history_model.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class OrderDetailsScreen extends GetWidget<OrderDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(right: 20),
                child: Text("Status:", style:  AppStyle.txtManropeBold16,),
              ),
              if (controller.orderHistory.value.isRefunded)
                Container(
                    padding: getPadding(all: 5),
                    decoration: BoxDecoration(
                        color: ColorConstant.red500,
                        borderRadius: BorderRadiusStyle.roundedBorder10),
                    child: Text("lbl_refunded".tr,
                        style: AppStyle.txtManropeSemiBold16whiteA700))
              else if (controller.orderHistory.value.isCanceled)
                Container(
                    padding: getPadding(all: 5),
                    decoration: BoxDecoration(
                        color: ColorConstant.yellow700,
                        borderRadius: BorderRadiusStyle.roundedBorder10),
                    child: Text("lbl_cancel".tr,
                        style: AppStyle.txtManropeSemiBold16whiteA700))
              else if (controller.orderHistory.value.isPaid)
                  Container(
                      padding: getPadding(all: 5),
                      decoration: BoxDecoration(
                          color: ColorConstant.green500,
                          borderRadius: BorderRadiusStyle.roundedBorder10),
                      child: Text("lbl_paid".tr,
                          style: AppStyle.txtManropeSemiBold16whiteA700))
                else
                  Container(
                      padding: getPadding(all: 5),
                      decoration: BoxDecoration(
                          color: ColorConstant.red500,
                          borderRadius: BorderRadiusStyle.roundedBorder10),
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
                decoration:
                    BoxDecoration(border: BorderRadiusStyle.borderBlack2),
                child: Column(
                  children: [
                    Text(
                      "Play date: ${DateFormat("dd-MM-yyyy").format(controller.orderHistory.value.bookings[0].playDate)}",
                      style: AppStyle.txtManropeBold16,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.orderHistory.value.bookings.length,
                      itemBuilder: (context, index) {
                        BookingOrderHistoryModel model =
                            controller.orderHistory.value.bookings[index];
                        return Container(
                          padding: getPadding( top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Slot ${index+1}: ${DateFormat("KK:mm").format(model.startTime)}-${DateFormat("KK:mm").format(model.endTime)}",
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
                !controller.orderHistory.value.bookings[0].isCancel &&
                !controller.orderHistory.value.isPaid)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: getMargin(top: 10),
                    child: CustomButton(
                      height: getVerticalSize(55),
                      width: getHorizontalSize(300),
                      variant: ButtonVariant.FillRed500,
                      fontStyle: ButtonFontStyle.ManropeBold14WhiteA700,
                      text: "lbl_cancel".tr,
                      onTap: () {
                        controller.cancelOrder();
                      },
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
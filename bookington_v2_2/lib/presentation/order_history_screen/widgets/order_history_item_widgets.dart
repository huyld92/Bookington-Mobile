import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/order_history_screen/controller/order_history_controller.dart';
import 'package:bookington_v2_2/presentation/order_history_screen/models/order_history_model.dart';
import 'package:flutter/material.dart';

class OrderHistoryItemWidgets extends StatelessWidget {
  OrderHistoryItemWidgets(this.model, this.index, {super.key});

  int index;
  OrderHistoryModel model;
  OrderHistoryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.orderDetailScreen(index);
      },
      child: Container(
        margin: getMargin(left: 10, bottom: 15, right: 10),
        padding: getPadding(all: 15),
        width: size.width,
        decoration: BoxDecoration(
          color: ColorConstant.whiteA700,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: ColorConstant.gray500.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.courtName,
              maxLines: 1,
              softWrap: true,
              style: AppStyle.txtManropeBold16,
            ),
            SizedBox(
              height: 20,
              child: Row(
                children: [
                  Text(
                    model.orderDate,
                    maxLines: 1,
                    softWrap: true,
                    style: AppStyle.txtManropeSemiBold14Gray500,
                  ),
                  const VerticalDivider(
                    width: 20,
                    thickness: 1,
                    indent: 3,
                    color: Colors.grey,
                  ),
                  Text(
                    model.orderTime,
                    maxLines: 1,
                    softWrap: true,
                    style: AppStyle.txtManropeSemiBold14Gray500,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Text("lbl_Hour".tr,
                      style: AppStyle.txtManropeSemiBold14Gray500),
                  Text(((model.bookings.length * 30) / 60).toString(),
                      style: AppStyle.txtManropeMedium16),
                ]),
                Column(children: [
                  Text("lbl_order_price".tr,
                      style: AppStyle.txtManropeSemiBold14Gray500),
                  Text("${model.totalPrice} đ", style: AppStyle.txtManropeMedium16),
                ]),
                if (model.isRefunded)
                  Container(
                      padding: getPadding(all: 5),
                      decoration: BoxDecoration(
                          color: ColorConstant.red500,
                          borderRadius: BorderRadiusStyle.roundedBorder10),
                      child: Text("lbl_refunded".tr,
                          style: AppStyle.txtManropeSemiBold14whiteA700))
                else if (model.isCanceled)
                  Container(
                      padding: getPadding(all: 5),
                      decoration: BoxDecoration(
                          color: ColorConstant.yellow700,
                          borderRadius: BorderRadiusStyle.roundedBorder10),
                      child: Text("lbl_cancelled".tr,
                          style: AppStyle.txtManropeSemiBold14whiteA700))
                else if (model.isPaid)
                  Container(
                      padding: getPadding(all: 5),
                      decoration: BoxDecoration(
                          color: ColorConstant.green500,
                          borderRadius: BorderRadiusStyle.roundedBorder10),
                      child: Text("lbl_paid".tr,
                          style: AppStyle.txtManropeSemiBold14whiteA700))
                else
                  Container(
                      padding: getPadding(all: 5),
                      decoration: BoxDecoration(
                          color: ColorConstant.red500,
                          borderRadius: BorderRadiusStyle.roundedBorder10),
                      child: Text("lbl_not_yet".tr,
                          style: AppStyle.txtManropeSemiBold16whiteA700))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

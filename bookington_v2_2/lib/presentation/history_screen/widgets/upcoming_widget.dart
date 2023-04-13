// ignore_for_file: must_be_immutable

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/history_screen/models/booking_history_model.dart';
import 'package:flutter/material.dart';

class UpComingWidget extends StatelessWidget {
  UpComingWidget(this.model, {super.key});

  late BookingHistoryScreenModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: getPadding(top: 1, bottom: 1, left: 10),
        //   child: Text(
        //     "",
        //     style: AppStyle.txtManropeBold16,
        //   ),
        // ),
        Container(
          margin: getMargin(top: 15, left: 10, right: 10),
          padding: getPadding(top: 5, bottom: 5, left: 10, right: 10),
          decoration: BoxDecoration(
            border: BorderRadiusStyle.border2Gray500,
            color: ColorConstant.gray200,
            borderRadius: BorderRadiusStyle.customBorderTLR10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Booking ID 12345678",
                style: AppStyle.txtManropeSemiBold14,
              ),
              Text(
                "100,000 VND",
                style: AppStyle.txtManropeBold14,
              ),
            ],
          ),
        ),
        Container(
          margin: getMargin(left: 10, right: 10),
          padding: getPadding(top: 5, bottom: 5, left: 10, right: 10),
          decoration: BoxDecoration(
            border: BorderRadiusStyle.border2Gray500LR,
            color: ColorConstant.gray300,
           ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Phu Tho court",
                style: AppStyle.txtManropeSemiBold14,
              ),
            ],
          ),
        ),
        Container(
          margin: getMargin(left: 10, right: 10),
          padding: getPadding(top: 5, bottom: 5, left: 10, right: 10),
          decoration: BoxDecoration(
              border: BorderRadiusStyle.border2Gray500,
              color: ColorConstant.gray200,
              borderRadius: BorderRadiusStyle.customBorderBLR10,
            // boxShadow: [
            //   BoxShadow(blurStyle: BlurStyle.outer,
            //     color: Colors.black87,
            //     blurRadius: 0,
            //     offset: Offset(0, 2),
            //   ),
            // ],
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Purchase Successful",
                style: AppStyle.txtManropeBold14Green500,
              ),Text(
                "15-12-2022",
                style: AppStyle.txtManropeBold14Green500,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


import 'package:bookington_v2_2/core/app_export.dart';
import 'package:flutter/material.dart';

class UpComingWidget extends StatelessWidget{
  UpComingWidget(this.model, {super.key});

  late String model;
  @override
  Widget build(BuildContext context) {
    return                   Container(

      // color: Colors.amberAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: getPadding(top: 10, bottom: 10, left: 10),
            child: Text(
              "December 2022",
              style: AppStyle.txtManropeBold16,
            ),
          ),
          Container(
            margin: getMargin(left: 10, right: 10),
            padding: getPadding(
                top: 5, bottom: 5, left: 10, right: 10),
            decoration: BoxDecoration(
              color: ColorConstant.whiteA700,
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
            padding: getPadding(
                top: 5, bottom: 5, left: 10, right: 10),
            color: ColorConstant.gray300,
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
            padding: getPadding(
                top: 5, bottom: 5, left: 10, right: 10),
            decoration: BoxDecoration(
                color: ColorConstant.whiteA700,
                borderRadius:
                BorderRadiusStyle.customBorderBLR10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Purchase Successful",
                  style: AppStyle.txtManropeBold14Green500,
                )
              ],
            ),
          ),
        ],
      ),
    );

  }

}
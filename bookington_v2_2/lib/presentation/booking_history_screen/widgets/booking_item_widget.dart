import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/booking_history_screen/models/booking_history_model.dart';
import 'package:flutter/material.dart';

class BookingItemWidget extends StatelessWidget {
  BookingItemWidget(this.model, {super.key});

  late BookingHistoryScreenModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(180),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(model.courtName, style: AppStyle.txtManropeExtraBold18),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(children: [
                Text("lbl_date".tr,
                    style: AppStyle.txtManropeSemiBold16Gray300),
                Text(model.playDate, style: AppStyle.txtManropeBold18),
              ]),
              Column(children: [
                Text("lbl_time".tr,
                    style: AppStyle.txtManropeSemiBold16Gray300),
                Text(model.startTime, style: AppStyle.txtManropeBold18),
              ]),
            ],
          ),
          const Divider(height: 1, thickness: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                Text("lbl_Hour".tr,
                    style: AppStyle.txtManropeSemiBold16Gray300),
                Text(model.totalHour, style: AppStyle.txtManropeMedium16),
              ]),
              Column(children: [
                Text("lbl_sub_court".tr,
                    style: AppStyle.txtManropeSemiBold16Gray300),
                Text(model.subCourtName, style: AppStyle.txtManropeMedium16),
              ]),
              Column(children: [
                Container(
                    padding: getPadding(all: 5),
                    decoration: BoxDecoration(color: ColorConstant.blue400,
                    borderRadius: BorderRadiusStyle.roundedBorder10),
                    child: Text(model.status,
                        style: AppStyle.txtManropeSemiBold16whiteA700)),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}

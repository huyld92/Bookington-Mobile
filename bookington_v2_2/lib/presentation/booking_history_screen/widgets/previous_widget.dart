import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/booking_history_screen/controller/booking_history_controller.dart';
import 'package:bookington_v2_2/presentation/booking_history_screen/models/booking_history_model.dart';
import 'package:bookington_v2_2/presentation/booking_history_screen/widgets/booking_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PreviousWidget extends StatelessWidget {
  PreviousWidget({super.key});

  HistoryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //     margin: getMargin(all: 10),
            //     padding: getPadding(left: 5, right: 5),
            //     decoration: BoxDecoration(
            //       border: BorderRadiusStyle.border2Gray500,
            //     ),
            //     height: 60,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Obx(
            //           () => Container(
            //             margin: getMargin(all: 5),
            //             child: TextButton.icon(
            //               style: TextButton.styleFrom(
            //                 textStyle: TextStyle(color: ColorConstant.black900),
            //                 shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadiusStyle.circleBorder23,
            //                 ),
            //               ),
            //               onPressed: () {
            //                 controller.presentDatePicker();
            //               },
            //               icon: CustomImageView(
            //                   height: 32,
            //                   width: 32,
            //                   svgPath: ImageConstant.imgCalendar,
            //                   color: ColorConstant.blue500),
            //               label: Text(
            //                 DateFormat('dd-MM-yyyy')
            //                     .format(controller.selectedDate.value),
            //                 style: AppStyle.txtManropeSemiBold14Blue500,
            //               ),
            //             ),
            //           ),
            //         ),
            //         Obx(
            //           () => Container(
            //             margin: getMargin(all: 5),
            //             child: TextButton.icon(
            //               style: TextButton.styleFrom(
            //                 textStyle: TextStyle(color: ColorConstant.black900),
            //                 shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadiusStyle.circleBorder23,
            //                 ),
            //               ),
            //               onPressed: () {
            //                 controller.presentDatePicker();
            //               },
            //               icon: CustomImageView(
            //                   height: 32,
            //                   width: 32,
            //                   svgPath: ImageConstant.imgCalendar,
            //                   color: ColorConstant.blue500),
            //               label: Text(
            //                 DateFormat('dd-MM-yyyy')
            //                     .format(controller.selectedDate.value),
            //                 style: AppStyle.txtManropeSemiBold14Blue500,
            //               ),
            //             ),
            //           ),
            //         ),
            //         GestureDetector(
            //             onTap: () {
            //               controller.filter();
            //             },
            //             child: Text(
            //               "Filter",
            //               style: AppStyle.txtManropeSemiBold16Blue500,
            //             ))
            //       ],
            //     )),
            Expanded(
              child: Obx(
                () => Container(
                  margin: getMargin(top: 20),
                  child: ListView.builder(
                      itemCount: controller.listPreviousBooking.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        BookingHistoryScreenModel model =
                            controller.listPreviousBooking[index];
                        // return UpComingWidget(model);
                        return BookingItemWidget(model);
                      }),
                ),
              ),
            ),
          ],
        ));
  }
}

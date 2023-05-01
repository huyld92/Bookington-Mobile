// ignore_for_file: must_be_immutable

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/booking_history_screen/controller/booking_history_controller.dart';
import 'package:bookington_v2_2/presentation/booking_history_screen/models/booking_history_model.dart';
import 'package:bookington_v2_2/presentation/booking_history_screen/widgets/booking_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpComingWidget extends StatelessWidget {
  UpComingWidget({super.key});

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
                      itemCount: controller.listUpcomingBooking.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        BookingHistoryScreenModel model =
                            controller.listUpcomingBooking[index];
                        return BookingItemWidget(model);
                      }),
                ),
              ),
            ),
          ],
        ));
  }
}

// return Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     // Padding(
//     //   padding: getPadding(top: 1, bottom: 1, left: 10),
//     //   child: Text(
//     //     "",
//     //     style: AppStyle.txtManropeBold16,
//     //   ),
//     // ),
//     Container(
//       margin: getMargin(top: 15, left: 10, right: 10),
//       padding: getPadding(top: 5, bottom: 5, left: 10, right: 10),
//       decoration: BoxDecoration(
//         border: BorderRadiusStyle.border2Gray500,
//         color: ColorConstant.gray200,
//         borderRadius: BorderRadiusStyle.customBorderTLR10,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             "Booking ID 12345678",
//             style: AppStyle.txtManropeSemiBold14,
//           ),
//           Text(
//             "100,000 VND",
//             style: AppStyle.txtManropeBold14,
//           ),
//         ],
//       ),
//     ),
//     Container(
//       margin: getMargin(left: 10, right: 10),
//       padding: getPadding(top: 5, bottom: 5, left: 10, right: 10),
//       decoration: BoxDecoration(
//         border: BorderRadiusStyle.border2Gray500LR,
//         color: ColorConstant.gray300,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             "Phu Tho court",
//             style: AppStyle.txtManropeSemiBold14,
//           ),
//         ],
//       ),
//     ),
//     Container(
//       margin: getMargin(left: 10, right: 10),
//       padding: getPadding(top: 5, bottom: 5, left: 10, right: 10),
//       decoration: BoxDecoration(
//         border: BorderRadiusStyle.border2Gray500,
//         color: ColorConstant.gray200,
//         borderRadius: BorderRadiusStyle.customBorderBLR10,
//         // boxShadow: [
//         //   BoxShadow(blurStyle: BlurStyle.outer,
//         //     color: Colors.black87,
//         //     blurRadius: 0,
//         //     offset: Offset(0, 2),
//         //   ),
//         // ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             "Purchase Successful",
//             style: AppStyle.txtManropeBold14Green500,
//           ),
//           Text(
//             "15-12-2022",
//             style: AppStyle.txtManropeBold14Green500,
//           ),
//         ],
//       ),
//     ),
//   ],
// );

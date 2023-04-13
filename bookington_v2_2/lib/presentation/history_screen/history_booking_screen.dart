import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/history_screen/controller/history_controller.dart';
import 'package:bookington_v2_2/presentation/history_screen/models/booking_history_model.dart';
import 'package:bookington_v2_2/presentation/history_screen/widgets/upcoming_widget.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/loading_widget.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryBookingScreen extends GetWidget<HistoryController> {
  const HistoryBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstant.whiteA700,
          appBar: CustomAppBar(
            height: getVerticalSize(50.00),
            centerTitle: true,
            title: Padding(
                padding: getPadding(top: 30),
                child: AppbarTitle(text: "lbl_my_booking".tr)),
            leadingWidth: 64,
            leading: AppbarImage(
              height: getSize(64.00),
              width: getSize(64.00),
              svgPath: ImageConstant.imgArrowLeft,
              margin: getMargin(left: 24),
              onTap: () {
                controller.getBack();
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: TabBar(
                      controller: controller.tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                        color: ColorConstant.blue400,
                      ),
                      labelColor: ColorConstant.whiteA700,
                      unselectedLabelColor: ColorConstant.black900,
                      tabs: controller.historyTabs),
                ),

                // tab bar view here
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      SizedBox(
                          height: 500,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: getMargin(all: 10),
                                  padding: getPadding(left: 5, right: 5),
                                  decoration: BoxDecoration(
                                    border: BorderRadiusStyle.border2Gray500,
                                  ),
                                  height: 60,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(
                                        () => Container(
                                          margin: getMargin(all: 5),
                                          child: TextButton.icon(
                                            style: TextButton.styleFrom(
                                              textStyle: TextStyle(
                                                  color:
                                                      ColorConstant.black900),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadiusStyle
                                                    .circleBorder23,
                                              ),
                                            ),
                                            onPressed: () {
                                              controller.presentDatePicker();
                                            },
                                            icon: CustomImageView(
                                                height: 32,
                                                width: 32,
                                                svgPath:
                                                    ImageConstant.imgCalendar,
                                                color: ColorConstant.blue500),
                                            label: Text(
                                              DateFormat('dd-MM-yyyy').format(
                                                  controller
                                                      .selectedDate.value),
                                              style: AppStyle
                                                  .txtManropeSemiBold14Blue500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => Container(
                                          margin: getMargin(all: 5),
                                          child: TextButton.icon(
                                            style: TextButton.styleFrom(
                                              textStyle: TextStyle(
                                                  color:
                                                      ColorConstant.black900),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadiusStyle
                                                    .circleBorder23,
                                              ),
                                            ),
                                            onPressed: () {
                                              controller.presentDatePicker();
                                            },
                                            icon: CustomImageView(
                                                height: 32,
                                                width: 32,
                                                svgPath:
                                                    ImageConstant.imgCalendar,
                                                color: ColorConstant.blue500),
                                            label: Text(
                                              DateFormat('dd-MM-yyyy').format(
                                                  controller
                                                      .selectedDate.value),
                                              style: AppStyle
                                                  .txtManropeSemiBold14Blue500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            controller.filter();
                                          },
                                          child: Text(
                                            "Filter",
                                            style: AppStyle
                                                .txtManropeSemiBold16Blue500,
                                          ))
                                    ],
                                  )),
                              Expanded(
                                child: Obx(
                                  () => ListView.builder(
                                      itemCount: controller.listBooking.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        BookingHistoryScreenModel model =
                                            controller.listBooking[index];
                                        return UpComingWidget(model);
                                      }),
                                ),
                              ),
                            ],
                          )),
                      // second tab bar view widget
                      const Center(
                        child: Text(
                          'Completed',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }, onLoading: const LoadingWidget());
  }
}

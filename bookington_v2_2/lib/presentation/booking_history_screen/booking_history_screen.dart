import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/booking_history_screen/controller/booking_history_controller.dart';
import 'package:bookington_v2_2/presentation/booking_history_screen/widgets/previous_widget.dart';
import 'package:bookington_v2_2/presentation/booking_history_screen/widgets/upcoming_widget.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/loading_widget.dart';

import 'package:flutter/material.dart';

class HistoryBookingScreen extends GetWidget<HistoryController> {
  const HistoryBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorConstant.whiteA700,
          appBar: CustomAppBar(
            height: getVerticalSize(80.00),
            centerTitle: true,
            title: AppbarTitle(text: "lbl_my_booking".tr),
            leadingWidth: getSize(64.00),
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
            padding: getPadding(),
            child: Column(
              children: [
                Container(
                  margin: getMargin(left: 10, right: 10),
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
                      UpComingWidget(),
                      // second tab bar view widget
                      PreviousWidget(),
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

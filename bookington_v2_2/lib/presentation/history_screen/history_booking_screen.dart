import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/history_screen/controller/history_controller.dart';
import 'package:bookington_v2_2/presentation/history_screen/widgets/upcoming_widget.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_bottom_bar.dart';

import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class HistoryBookingScreen extends GetWidget<HistoryController> {
  const HistoryBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CustomBottomBar.selectedIndex = 3.obs;

    return SafeArea(
      child: Scaffold(
         backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(50.00),
          centerTitle: true,
          title: Padding(padding: getPadding(top: 30), child: AppbarTitle(text: "lbl_my_booking".tr)),
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
                                margin: getMargin(all: 20),
                                padding: getPadding(left: 20, right: 20),
                                decoration: BoxDecoration(
                                  border: BorderRadiusStyle.border2Gray500,
                                ),
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("13-12-2022 to 13-03-2023",style: AppStyle.txtManropeSemiBold16Gray900,),
                                    GestureDetector(
                                        onTap: (){
                                          controller.filter();
                                        },
                                        child: Text("Filter", style: AppStyle.txtManropeSemiBold16Blue500,))
                                  ],
                                )
                            ),

                            Expanded(
                              child: ListView.builder(
                                  itemCount: controller.listBooking.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (BuildContext context, int index) {
                                    String model = controller.listBooking[index];
                                    return UpComingWidget(model);
                                  }),
                            ),
                          ],
                        )),
                    // second tab bar view widget
                    Center(
                      child: Text(
                        'Completed',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    // second tab bar view widget
                    Center(
                      child: Text(
                        'Canceled',
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
  }
}


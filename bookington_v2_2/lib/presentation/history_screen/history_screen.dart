import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/history_screen/controller/history_controller.dart';
import 'package:bookington_v2_2/presentation/history_screen/widgets/upcoming_widget.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_bottom_bar.dart';

import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class HistoryScreen extends GetWidget<HistoryController> {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CustomBottomBar.selectedIndex = 3.obs;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.whiteA700,
      appBar: CustomAppBar(
        height: getVerticalSize(80.00),
        leadingWidth: 64,
        centerTitle: true,
        title: AppbarTitle(text: "lbl_history".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // give the tab bar a height [can change hheight to preferred height]
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                  controller: controller.tabcontroller,

                  // give the indicator a decoration (color and border radius)
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

            Container(
              margin: getMargin(left: 20, right: 20),
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
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: controller.tabcontroller,
                children: [
                   SizedBox(
                      height: 500,
                      child: Column(
                        children: [
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
      bottomNavigationBar: CustomBottomBar(
        onChanged: (BottomBarEnum type) {
          Get.toNamed(getCurrentRoute(type));
        },
      ),
    );
  }
}

///Handling route based on bottom click actions
String getCurrentRoute(BottomBarEnum type) {
  switch (type) {
    case BottomBarEnum.Home:
      return AppRoutes.homeScreen;
    case BottomBarEnum.Message:
      return AppRoutes.messagesScreen;
    case BottomBarEnum.Search:
      return AppRoutes.searchScreen;
    case BottomBarEnum.History:
      return AppRoutes.historyScreen;
    case BottomBarEnum.Profile:
      return AppRoutes.profileScreen;
    default:
      return "/";
  }
}

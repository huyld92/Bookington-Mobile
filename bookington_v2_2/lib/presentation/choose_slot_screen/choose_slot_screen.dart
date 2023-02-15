import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/slot_model.dart';

import 'package:bookington_v2_2/presentation/choose_slot_screen/controller/choose_slot_controller.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_iconbutton.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
 import 'package:flutter/material.dart';

import 'widgets/slot_item_widget.dart';

// ignore: must_be_immutable
class ChooseSlotScreen extends GetWidget<ChooseSlotController> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        // top: false,
        // bottom: false,
        child: Scaffold(
            // backgroundColor: ColorConstant.blueGray50,
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(56.00),
                leadingWidth: 64,
                leading: AppbarIconbutton(
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24),
                    onTap: onTapArrowleft()),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_choose_slot".tr),

            ),
            body: Column(children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(5.0) //
                        ),
                  color: ColorConstant.blueGray50

                ),
                padding: EdgeInsets.all(0.0),
                child: SizedBox.fromSize(
                  size: Size.fromHeight(110),
                  child:
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding:
                            getPadding(left: 30, top: 5, right: 4),
                            child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath:
                                      ImageConstant.imgCalendar,
                                      height: getVerticalSize(35.00),
                                      width: getHorizontalSize(32.00),
                                      margin: getMargin(bottom: 2)),
                                  Padding(
                                      padding: getPadding(top: 8, left: 21),
                                      child: Text(
                                          "11/12/2022".tr,
                                          overflow:
                                          TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtManropeBold20))
                                ])),
                        Padding(
                            padding: getPadding(left: 30, top: 5, bottom: 10),
                            child: Row(children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgClock,
                                  height: getSize(40.00),
                                  width: getSize(40.00)),
                              Padding(
                                  padding: getPadding(
                                      left: 21, top: 8, bottom: 6),
                                  child: Text("court 1".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                      AppStyle.txtManropeBold20))
                            ]))
                      ])
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 30, bottom: 10),
                child: Text(
                  "Choose Slot",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                  margin: getMargin(left: 20, right: 20),
                  width: 360,
                  height: 440,
                  decoration: AppDecoration.fillBluegray50.copyWith(
                    border: BorderRadiusStyle.borderBlack2,
                  ),
                  child: Obx(
                    () => GridView.builder(
                        padding: getPadding(top: 5, left: 5, right: 5),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: getVerticalSize(95.00),
                            // maxCrossAxisExtent: 300,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 2,
                            crossAxisCount: 3),
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.slotList.length,
                        itemBuilder: (BuildContext ctx, index) {
                           return SlotItemWidget(index);
                        }),
                  )),
              Container(
                padding: getPadding(left: 10, right: 10, top: 0),
                margin: getMargin(left: 16, right: 20, top: 10),
                height: 50,
                child: Row(
                  children: [
                    Container(
                      margin: getMargin(left: 10, right: 10),
                      height: 20,
                      width: 40,
                      color: ColorConstant.blue500,
                    ),
                    Text(
                      "Selecting",
                      style: TextStyle(color: ColorConstant.blue500),
                    ),
                    Container(
                      margin: getMargin(left: 10, right: 10),
                      height: 20,
                      width: 40,
                      color: ColorConstant.black900,
                    ),
                    Text(
                      "Can book",
                      style: TextStyle(color: ColorConstant.black900),
                    ),
                    Container(
                      margin: getMargin(left: 10, right: 10),
                      height: 20,
                      width: 40,
                      color: ColorConstant.gray500,
                    ),
                    Text(
                      "Booked",
                      style: TextStyle(color: ColorConstant.gray500),
                    ),
                  ],
                ),
              )
            ]),
            bottomNavigationBar: Padding(
                padding: getPadding(left: 24, right: 24, bottom: 15),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomButton(
                    height: 55,
                    width: 320,
                    text: "lbl_next".tr,
                    onTap: () {
                      print("next");
                      controller.nextPaymentScreen();
                    },
                  )
                ]))));
  }

  onTapArrowleft() {
    Get.back();
  }
}

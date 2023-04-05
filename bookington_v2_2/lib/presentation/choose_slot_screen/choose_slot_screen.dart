import 'package:bookington_v2_2/core/app_export.dart';

import 'package:bookington_v2_2/presentation/choose_slot_screen/controller/choose_slot_controller.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:bookington_v2_2/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'widgets/slot_item_widget.dart';

// ignore: must_be_immutable
class ChooseSlotScreen extends GetWidget<ChooseSlotController> {
  const ChooseSlotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(80.00),
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
          centerTitle: true,
          title: AppbarTitle(text: "lbl_choose_slot".tr),
        ),
        body: Column(children: [
          Container(
            width: 360,
            decoration: BoxDecoration(
              border: Border.all(color: ColorConstant.black900, width: 2.0),
              borderRadius: BorderRadiusStyle.circleBorder5,
            ),
            child: SizedBox.fromSize(
                size: const Size.fromHeight(100),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: getPadding(left: 30, top: 5, right: 4),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgCalendar,
                                    height: getVerticalSize(32.00),
                                    width: getHorizontalSize(32.00),
                                    margin: getMargin(bottom: 2)),
                                Padding(
                                  padding: getPadding(top: 5, left: 21),
                                  child: Obx(() => Text(
                                      DateFormat("dd-MM-yyyy").format(controller.playDate.value),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtManropeBold18)),
                                )
                              ])),
                      Padding(
                          padding: getPadding(left: 30, top: 5, bottom: 10),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgClock,
                                height: getSize(32.00),
                                width: getSize(32.00)),
                            Padding(
                                padding:
                                    getPadding(left: 21, top: 5, bottom: 6),
                                child: Obx(
                                  () => Text(controller.courtName.value,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtManropeBold18,
                                ))),
                          ]))
                    ])),
          ),
          Padding(
            padding: getPadding(top: 10, left: 30, bottom: 10),
            child: Text(
              "Choose Slot",
              style: AppStyle.txtManropeSemiBold26,
            ),
          ),
          Container(
            margin: getMargin(left: 20, right: 20),
            width: getHorizontalSize(360),
            height: getVerticalSize(400),
            decoration: AppDecoration.fillWhiteA700.copyWith(
              border: BorderRadiusStyle.borderBlack2,
            ),
            child:  controller.obx(
                  (state) => Obx(() => GridView.builder(
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
                    }),),
                onLoading:
                 Dialog(
                  backgroundColor: Colors.transparent,
                  child: Container(
                    height: 150,
                    width: 50,
                    padding: getPadding(top: 50),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: getPadding(right: 10),
                            child: const CircularProgressIndicator(),
                          ),
                          Padding(
                            padding: getPadding(top: 20),
                            child: Text("loading....",
                                style: AppStyle.txtManropeSemiBold16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                onEmpty: const Dialog(
                  child: Center(child: Text("EMPTY")),
                )
            ),
          ),
          Container(
            padding: getPadding(left: 10, right: 10),
            margin: getMargin(left: 16, right: 20, top: 5),
            height: 50,
            child: Row(
              children: [
                Container(
                  margin: getMargin(left: 5, right: 10),
                  height: getVerticalSize(15),
                  width: getHorizontalSize(30),
                  color: ColorConstant.blue500,
                ),
                Text(
                  "lbl_selecting".tr,
                  style: TextStyle(color: ColorConstant.blue500),
                ),
                Container(
                  margin: getMargin(left: 10, right: 10),
                  height: getVerticalSize(15),
                  width: getHorizontalSize(30),
                  color: ColorConstant.black900,
                ),
                Text(
                  "lbl_can_book".tr,
                  style: TextStyle(color: ColorConstant.black900),
                ),
                Container(
                  margin: getMargin(left: 10, right: 10),
                  height: getVerticalSize(15),
                  width: getHorizontalSize(30),
                  color: ColorConstant.gray500,
                ),
                Text(
                  "lbl_booked".tr,
                  style: TextStyle(color: ColorConstant.gray500),
                ),
              ],
            ),
          )
        ]),
        bottomNavigationBar: Padding(
          padding: getPadding(left: 24, right: 24, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => CustomButton(
                  height: 55,
                  width: 320,
                  text: "lbl_next".tr,
                  variant: controller.listSelected.contains(true)
                      ? ButtonVariant.FillBlue400
                      : ButtonVariant.FillGray300,
                  onTap: () {
                    if (controller.listSelected.contains(true)) {
                      controller.nextPaymentScreen();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/choose_court_screen/controller/choose_court_controller.dart';
import 'package:bookington_v2_2/presentation/choose_court_screen/widgets/sub_court_item_widget.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ChooseCourtScreen extends GetWidget<ChooseCourtController> {
  const ChooseCourtScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List<bool> _selections = List.generate(length, (_) => false);

    return SafeArea(
         bottom: false,
        child: Scaffold(
             backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(80.00),
                leadingWidth: 64,
                leading: AppbarImage(
                  height: getSize(64.00),
                  width: getSize(64.00),
                  svgPath: ImageConstant.imgArrowleft,
                  margin: getMargin(left: 24),
                  onTap: () {
                    controller.getBack();
                  },
                ),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_choose_court".tr),
            ),
            body: Column(children: [
              Container(
                padding: getPadding(top: 10, bottom: 10),
                width: 350,
                decoration: BoxDecoration(
                  border: BorderRadiusStyle.borderBlack2,
                  borderRadius: BorderRadiusStyle.circleBorder5,
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Obx(
                    () => TextButton.icon(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(color: ColorConstant.black900),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.circleBorder23,
                        ),
                      ),
                      onPressed: () {
                        controller.presentDatePicker();
                      },
                      icon: CustomImageView(
                          height: 32,
                          width: 32,
                          svgPath: ImageConstant.imgCalendar,
                          color: ColorConstant.blue500),
                      label: Text(
                        DateFormat('dd-MM-yyyy')
                            .format(controller.selectedDate.value),
                        style: AppStyle.txtManropeSemiBold20BlueA400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),
                  Obx(
                    () => TextButton.icon(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(color: ColorConstant.black900),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.circleBorder23,
                        ),
                      ),
                      onPressed: () {
                        controller.presentTimePicker();
                      },
                      icon: CustomImageView(
                          height: 32,
                          width: 32,
                          svgPath: ImageConstant.imgClock,
                          color: ColorConstant.blue500),
                      label: Text(
                        controller.selectedTime.value.format(context),
                        style: AppStyle.txtManropeSemiBold20BlueA400,
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: getPadding(top: 10, left: 30, bottom: 20),
                child: Text(
                  "Choose Court",
                  style: AppStyle.txtManropeSemiBold30,
                ),
              ),
              Container(
                  margin: getMargin(left: 20, right: 20),
                  width: getVerticalSize(360),
                  height:  getVerticalSize(400),
                  decoration: AppDecoration.fillWhiteA700.copyWith(
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
                            mainAxisSpacing: 3,
                            crossAxisCount: 3),
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.subCourtList.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return SubCourtItemWidget(index + 1);
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
                      color: ColorConstant.blue400,
                    ),
                    Text(
                      "lbl_selecting".tr,
                      style: TextStyle(color: ColorConstant.blue400),
                    ),
                    Container(
                      margin: getMargin(left: 10, right: 10),
                      height: 20,
                      width: 40,
                      color: ColorConstant.black900,
                    ),
                    Text(
                      "lbl_can_book".tr,
                      style: TextStyle(color: ColorConstant.black900),
                    ),
                    Container(
                      margin: getMargin(left: 10, right: 10),
                      height: 20,
                      width: 40,
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
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomButton(
                    height: 55,
                    width: 320,
                    text: "lbl_next".tr,
                    onTap: () {
                      controller.nextChooseSlot();
                      print("next");
                    },
                  )
                ]))));
  }
}

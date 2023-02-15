import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/sub_court_model.dart';
import 'package:bookington_v2_2/presentation/choose_court_screen/controller/choose_court_controller.dart';
import 'package:bookington_v2_2/presentation/choose_court_screen/widgets/sub_court_item_widget.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_iconbutton.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ChooseCourtScreen extends GetWidget<ChooseCourtController> {
  @override
  Widget build(BuildContext context) {
    // List<bool> _selections = List.generate(length, (_) => false);

    return SafeArea(
        // top: false,
        // bottom: false,
        child: Scaffold(
            // backgroundColor: ColorConstant.blueGray50,
            backgroundColor: ColorConstant.gray300,
            appBar: CustomAppBar(
                height: getVerticalSize(56.00),
                leadingWidth: 64,
                leading: AppbarIconbutton(
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24),
                    onTap: onTapArrowleft()),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_choose_court".tr)),
            body: Column(children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(5.0) //
                        )),
                padding: EdgeInsets.all(0.0),
                child: SizedBox.fromSize(
                  size: Size.fromHeight(80),
                  child: Obx(
                    () => TextButton.icon(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
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
                        controller.selectedDate != null
                            ? DateFormat('dd-MM-yyyy')
                                .format(controller.selectedDate.value)
                            : 'Selected date!',
                        style: AppStyle.txtManropeSemiBold24Blue500,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 30, bottom: 20),
                child: Text(
                  "Choose Court",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                  margin: getMargin(left: 20, right: 20),
                  width: 360,
                  height: 420,
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
                      controller.nextChooseSlot();
                      print("next");
                    },
                  )
                ]))));
  }

  onTapArrowleft() {
    // Get.back();
  }
}

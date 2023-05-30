import 'package:bookington_v2_2/data/models/district_model.dart';
import 'package:bookington_v2_2/data/models/province_model.dart';
import 'package:bookington_v2_2/widgets/custom_bottom_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import 'controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';

import 'widgets/search_result_widget.dart';

// ignore_for_file: must_be_immutable
class SearchScreen extends GetWidget<SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CustomBottomBar.selectedIndex = 2.obs;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorConstant.gray900,
          body: Container(
            width: size.width,
            decoration: AppDecoration.fillWhiteA700,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: getPadding(left: 10, right: 10, top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: getVerticalSize(360),
                            padding: getPadding(top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              border: BorderRadiusStyle.border2Gray500,
                              borderRadius: BorderRadiusStyle.roundedBorder8,
                            ),
                            child: Column(
                              children: [
                                // Container(
                                //   width: getVerticalSize(360),
                                //   height: getHorizontalSize(40),
                                //   margin: getMargin(left: 10, right: 10),
                                //   decoration: BoxDecoration(
                                //       borderRadius:
                                //           BorderRadiusStyle.circleBorder23,
                                //       border: BorderRadiusStyle.border2Gray500),
                                //   child: TextField(
                                //     controller: controller.searchController,
                                //     focusNode: FocusNode(),
                                //     decoration: InputDecoration(
                                //       hintText: 'lbl_search_for_court'.tr,
                                //       prefixIcon: const Icon(Icons.search),
                                //       fillColor: ColorConstant.whiteA700,
                                //       contentPadding: getPadding(all: 5),
                                //       border: InputBorder.none,
                                //     ),
                                //     style: AppStyle.txtManropeRegular14,
                                //     textInputAction: TextInputAction.search,
                                //     onSubmitted: (value) {
                                //       FocusManager.instance.primaryFocus
                                //           ?.unfocus();
                                //       controller.searchByName(1);
                                //     },
                                //   ),
                                // ),
                                Row(
                                  children: [
                                    Obx(
                                      () => Container(
                                        width: getVerticalSize(160),
                                        height: getVerticalSize(40),
                                        decoration: BoxDecoration(
                                          border:
                                              BorderRadiusStyle.border2Gray500,
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder16,
                                        ),
                                        padding: getPadding(
                                            top: 5,
                                            left: 5,
                                            right: 5,
                                            bottom: 5),
                                        margin: getMargin(all: 10),
                                        child: DropdownButton<ProvinceModel>(
                                          underline: const SizedBox(),
                                          isExpanded: true,
                                          items: controller.province.map(
                                              (ProvinceModel
                                                  dropDownStringItem) {
                                            return DropdownMenuItem<
                                                ProvinceModel>(
                                              value: dropDownStringItem,
                                              child: Text(
                                                dropDownStringItem.provinceName,
                                                style: AppStyle
                                                    .txtManropeRegular14,
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (value) => controller
                                              .onSelectedProvince(value!),
                                          value:
                                              controller.selectedProvince.value,
                                        ),
                                      ),
                                    ),
                                    Obx(
                                      () => Container(
                                        width: getVerticalSize(160),
                                        height: getVerticalSize(40),
                                        margin: getMargin(top: 10, bottom: 10),
                                        padding: getPadding(all: 5),
                                        decoration: BoxDecoration(
                                          border:
                                              BorderRadiusStyle.border2Gray500,
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder16,
                                        ),
                                        child: DropdownButton<DistrictModel>(
                                          underline: SizedBox(),
                                          isExpanded: true,
                                          items: controller.district.map(
                                              (DistrictModel
                                                  dropDownStringItem) {
                                            return DropdownMenuItem<
                                                DistrictModel>(
                                              value: dropDownStringItem,
                                              child: Text(
                                                dropDownStringItem.districtName,
                                                style: AppStyle
                                                    .txtManropeRegular14,
                                              ),
                                            );
                                          }).toList(),
                                          // onChanged: (value) => print(value),
                                          onChanged: (value) => controller
                                              .onSelectedDistrict(value!),
                                          value:
                                              controller.selectedDistrict.value,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: getMargin(left: 10, right: 10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Obx(
                                          () => Container(
                                            margin: getMargin(all: 5),
                                            // decoration: BoxDecoration(
                                            //     border: BorderRadiusStyle
                                            //         .border1Gray300),
                                            decoration: BoxDecoration(
                                              border: BorderRadiusStyle
                                                  .border1Gray300,
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder16,
                                            ),
                                            child: TextButton.icon(
                                              style: TextButton.styleFrom(
                                                textStyle: TextStyle(
                                                    color:
                                                        ColorConstant.black900),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadiusStyle
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
                                                    .txtManropeSemiBold20BlueA400,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Obx(
                                          () => Container(
                                            width: getHorizontalSize(130),
                                            margin: getMargin(all: 5),
                                            decoration: BoxDecoration(
                                              border: BorderRadiusStyle
                                                  .border1Gray300,
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder16,
                                            ),
                                            child: TextButton.icon(
                                              style: TextButton.styleFrom(
                                                textStyle: TextStyle(
                                                    color:
                                                        ColorConstant.black900),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .circleBorder23,
                                                ),
                                              ),
                                              onPressed: () {
                                                DatePicker.showTimePicker(
                                                    context,
                                                    showTitleActions: true,
                                                    showSecondsColumn: false,
                                                    onConfirm: (date) {
                                                  controller.timePicker(date);
                                                },
                                                    currentTime: controller
                                                        .selectedTime.value,
                                                    locale: LocaleType.vi);
                                              },
                                              icon: CustomImageView(
                                                  height: getSize(32),
                                                  width: getSize(32),
                                                  svgPath:
                                                      ImageConstant.imgClock,
                                                  color: ColorConstant.blue500),
                                              label: Text(
                                                DateFormat("HH:mm").format(
                                                    controller
                                                        .selectedTime.value),
                                                style: AppStyle
                                                    .txtManropeSemiBold20BlueA400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),

                                CustomButton(
                                  height: getSize(40),
                                  width: getSize(355),
                                  margin: getMargin(left: 10, right: 10),
                                  padding: ButtonPadding.PaddingAll8,
                                  text: "lbl_search".tr,
                                  onTap: () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    controller.searchByName(1);
                                  },
                                )
                              ],
                            ),
                          ),
                          SearchResultWidget(controller),
                        ],
                      ),
                    ),
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
        ),
      ),
    );
  }
}

String getCurrentRoute(BottomBarEnum type) {
  switch (type) {
    case BottomBarEnum.Home:
      return AppRoutes.homeScreen;
    case BottomBarEnum.Message:
      return AppRoutes.messagesScreen;
    case BottomBarEnum.Search:
      return AppRoutes.searchScreen;
    case BottomBarEnum.Forum:
      return AppRoutes.forumScreen;
    case BottomBarEnum.Profile:
      return AppRoutes.profileScreen;
    default:
      return "/";
  }
}

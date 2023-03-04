import 'package:bookington_v2_2/data/models/district_model.dart';
import 'package:bookington_v2_2/data/models/province_model.dart';
import 'package:bookington_v2_2/widgets/custom_bottom_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';

import 'controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';

import 'widgets/search_result_widget.dart';
import 'widgets/search_empty_widget.dart';

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
                    child: Obx(
                  () => SingleChildScrollView(
                    child: Padding(
                      padding: getPadding(
                        left: 10,
                        right: 10,
                        top: 40,
                      ),
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
                                Container(
                                  width: getVerticalSize(360),
                                  margin: getMargin(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder23,
                                      border: BorderRadiusStyle.border2Gray500),
                                  child: TextField(
                                    controller: controller.searchController,
                                    focusNode: FocusNode(),
                                    decoration: InputDecoration(
                                      hintText: 'lbl_search_for_court'.tr,
                                      prefixIcon: const Icon(Icons.search),
                                      fillColor: ColorConstant.whiteA700,
                                      contentPadding: getPadding(all: 16),
                                      border: InputBorder.none,
                                    ),
                                    textInputAction: TextInputAction.search,
                                    onSubmitted: (value) {
                                      controller.searchByName(1);
                                    },
                                  ),
                                ),
                                Row(
                                  children: [
                                    Obx(
                                      () => Container(
                                        width: getVerticalSize(160),
                                        height: getVerticalSize(55),
                                        decoration: BoxDecoration(
                                          border:
                                              BorderRadiusStyle.border2Gray500,
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder16,
                                        ),
                                        padding: getPadding(
                                            top: 15,
                                            left: 5,
                                            right: 5,
                                            bottom: 15),
                                        margin: getMargin(all: 10),
                                        child: DropdownButton<ProvinceModel>(
                                          underline: SizedBox(),
                                          isExpanded: true,
                                          items: controller.province.map(
                                              (ProvinceModel
                                                  dropDownStringItem) {
                                            return DropdownMenuItem<
                                                ProvinceModel>(
                                              value: dropDownStringItem,
                                              child: Text(dropDownStringItem
                                                  .provinceName),
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
                                        height: getVerticalSize(55),
                                        margin: getPadding(top: 10, bottom: 10),
                                        padding: getPadding(
                                            top: 15,
                                            left: 5,
                                            right: 5,
                                            bottom: 15),
                                        decoration: BoxDecoration(
                                          border:
                                              BorderRadiusStyle.border2Gray500,
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder16,
                                        ),
                                        child: DropdownButton<DistrictModel>(
                                          underline: SizedBox(),
                                          isExpanded: true,
                                          items: controller.dictrict.map(
                                              (DistrictModel
                                                  dropDownStringItem) {
                                            return DropdownMenuItem<
                                                DistrictModel>(
                                              value: dropDownStringItem,
                                              child: Text(dropDownStringItem
                                                  .districtName),
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
                                CustomButton(
                                  height: 50,
                                  width: 355,
                                  margin: getMargin(left: 10, right: 10),
                                  text: "lbl_search".tr,
                                  onTap: () {
                                    print("search");
                                    controller.searchByName(1);
                                    // controller.nextPaymentScreen();
                                  },
                                )
                              ],
                            ),
                          ),
                          controller.listSearchMode.isNotEmpty
                              ? SearchResultWidget(controller)
                              : SearchEmptyWidget(),
                        ],
                      ),
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
              // Get.toNamed(getCurrentRoute(type),id : 3);
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
    case BottomBarEnum.History:
      return AppRoutes.historyScreen;
    case BottomBarEnum.Profile:
      return AppRoutes.profileScreen;
    default:
      return "/";
  }
}

Widget getCurrentPage(String currentRoute) {
  switch (currentRoute) {
    case AppRoutes.searchScreen:
      return const SearchScreen();
    default:
      return const SearchScreen();
  }
}

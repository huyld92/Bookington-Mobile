import 'package:bookington_v2_2/widgets/custom_bottom_bar.dart';

import 'controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';

import 'widgets/search_result_widget.dart';
import 'widgets/search_empty_widget.dart';

// ignore_for_file: must_be_immutable
class SearchScreen extends GetWidget<SearchController> {

  @override
  Widget build(BuildContext context) {
     return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.gray900,
        body: Container(
          width: size.width,
          decoration: AppDecoration.fillGray300,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: getVerticalSize(360),
                          color: ColorConstant.whiteA700,
                          child: TextField(
                            controller: controller.searchController,
                            focusNode: FocusNode(),
                            decoration: InputDecoration(
                              hintText: 'Search for something',
                              prefixIcon: Icon(Icons.search),
                              fillColor: ColorConstant.whiteA700,
                              contentPadding: getPadding(all: 16),
                            ),
                            textInputAction: TextInputAction.search,
                            onSubmitted: (value) {
                              print("value saerch Screen: " + value);
                              controller.searchByName(1,value.trim());
                            },
                          ),
                        ),
                        controller.listSearchMode.length > 0
                            ? SearchResultWidget(controller)
                            : SearchEmptyWidget(),
                      ],
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            Get.toNamed(getCurrentRoute(type));
          },
        ),
      ),
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreen;
      case BottomBarEnum.Message:
        return AppRoutes.searchScreen;
      case BottomBarEnum.Search:
        return AppRoutes.searchScreen;
      case BottomBarEnum.History:
        return AppRoutes.searchScreen;
      case BottomBarEnum.Profile:
        return AppRoutes.profileScreen;
      default:
        return "/";
    }
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.searchScreen:
        return SearchScreen();
      default:
        return DefaultWidget();
    }
  }
}

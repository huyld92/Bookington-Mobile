import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/competition_model.dart';
import 'package:bookington_v2_2/presentation/forum_screen/controller/forum_controller.dart';
import 'package:bookington_v2_2/presentation/forum_screen/model/forum_match_model.dart';
import 'package:bookington_v2_2/presentation/forum_screen/widgets/forum_competition_widget.dart';
import 'package:bookington_v2_2/presentation/forum_screen/widgets/forum_matches_widget.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/custom_bottom_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ForumScreen extends GetWidget<ForumController> {
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CustomBottomBar.selectedIndex = 3.obs;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: ColorConstant.whiteA700,
            centerTitle: true,
            title: Container(
                margin: getMargin(top: 20),
                child: AppbarTitle(text: "lbl_forum".tr)),
            // bottom: TabBar(
            //   controller: controller.tabController,
            //   tabs: controller.forumTabs,
            //   labelColor: ColorConstant.blue500,
            // ),
            actions: [
              Padding(
                padding: getPadding(all: 10),
                child: CustomImageView(
                  height: 32,
                  svgPath: ImageConstant.imgFilter,
                ),
              ),
            ],
          ),
          body:
          Container(
            padding: getPadding(top: 20, bottom: 20, left: 10, right: 10),
            height: 700,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(left: 10, right: 10, bottom: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 253,
                          padding: getPadding(),
                          decoration: BoxDecoration(
                              border: BorderRadiusStyle.border2Gray500,
                              borderRadius:
                              BorderRadiusStyle.roundedBorder10),
                          child: TextField(
                            controller: controller.joinMatchController,
                            focusNode: FocusNode(),
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              hintText: 'msg_match_code'.tr,
                              fillColor: ColorConstant.whiteA700,
                              contentPadding: getPadding(
                                  left: 20, top: 5, bottom: 5, right: 20),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                            style: AppStyle.txtManropeRegular14,
                            textInputAction: TextInputAction.search,
                            onSubmitted: (value) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              // controller.searchByName(1);
                            },
                          ),
                        ),
                        Padding(
                          padding: getPadding(left: 10),
                          child: CustomButton(
                            height: 50,
                            width: 90,
                            text: "lbl_join".tr,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: controller.listCompetition.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          ForumMatchModel model =
                          controller.listMatches[index];
                          return ForumMatchWidget(model);
                        }),
                  ),
                ]),
          ),

          // TabBarView(
          //   controller: controller.tabController,
          //   children: [
          //     Container(
          //       padding: getPadding(all: 15),
          //       height: 500,
          //       child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Align(
          //               alignment: Alignment.bottomRight,
          //               child: CustomImageView(
          //                 height: 32,
          //                 svgPath: ImageConstant.imgFilter,
          //               ),
          //             ),
          //             Expanded(
          //               child: ListView.builder(
          //                   itemCount: controller.listCompetition.length,
          //                   scrollDirection: Axis.vertical,
          //                   itemBuilder: (BuildContext context, int index) {
          //                     CompetitionModel model =
          //                         controller.listCompetition[index];
          //                     return CompetitionWidget(model);
          //                   }),
          //             ),
          //           ]),
          //     ),
          //     Container(
          //       padding: getPadding(top: 20, bottom: 20, left: 10, right: 10),
          //       height: 500,
          //       child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Padding(
          //               padding: getPadding(left: 10, right: 10, bottom: 20),
          //               child: Row(
          //                 children: [
          //                   Container(
          //                     width: 253,
          //                     padding: getPadding(),
          //                     decoration: BoxDecoration(
          //                         border: BorderRadiusStyle.border2Gray500,
          //                         borderRadius:
          //                             BorderRadiusStyle.roundedBorder10),
          //                     child: TextField(
          //                       controller: controller.joinMatchController,
          //                       focusNode: FocusNode(),
          //                       enableSuggestions: false,
          //                       autocorrect: false,
          //                       decoration: InputDecoration(
          //                         hintText: 'msg_match_code'.tr,
          //                         fillColor: ColorConstant.whiteA700,
          //                         contentPadding: getPadding(
          //                             left: 20, top: 5, bottom: 5, right: 20),
          //                         border: InputBorder.none,
          //                         focusedBorder: InputBorder.none,
          //                         enabledBorder: InputBorder.none,
          //                       ),
          //                       style: AppStyle.txtManropeRegular14,
          //                       textInputAction: TextInputAction.search,
          //                       onSubmitted: (value) {
          //                         FocusManager.instance.primaryFocus?.unfocus();
          //                         // controller.searchByName(1);
          //                       },
          //                     ),
          //                   ),
          //                   Padding(
          //                     padding: getPadding(left: 10),
          //                     child: CustomButton(
          //                       height: 50,
          //                       width: 90,
          //                       text: "lbl_join".tr,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             Expanded(
          //               child: ListView.builder(
          //                   itemCount: controller.listCompetition.length,
          //                   scrollDirection: Axis.vertical,
          //                   itemBuilder: (BuildContext context, int index) {
          //                     ForumMatchModel model =
          //                         controller.listMatches[index];
          //                     return ForumMatchWidget(model);
          //                   }),
          //             ),
          //           ]),
          //     ),
          //   ],
          // ),
          floatingActionButton: Container(
            margin: getMargin(bottom: 20, right: 10),
            child: FloatingActionButton(
              onPressed: () {
                controller.createMatchDialog();
              },
              child: CustomImageView(
                svgPath: ImageConstant.imgBluePlus,
              ),
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

///Handling route based on bottom click actions
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

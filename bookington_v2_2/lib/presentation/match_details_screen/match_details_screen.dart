import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/match_details_screen/controller/match_details_controller.dart';
import 'package:bookington_v2_2/presentation/match_details_screen/model/members_model.dart';
import 'package:bookington_v2_2/presentation/match_details_screen/model/round_model.dart';
import 'package:bookington_v2_2/presentation/match_details_screen/widgets/members_list_widget.dart';
import 'package:bookington_v2_2/presentation/match_details_screen/widgets/round_list_widget.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:flutter/material.dart';

class MatchDetailsScreen extends GetWidget<MatchDetailsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: ColorConstant.whiteA700,
          leadingWidth: 64,
          leading: AppbarImage(
            height: getVerticalSize(64),
            width: getVerticalSize(64),
            svgPath: ImageConstant.imgArrowLeft,
            margin: getMargin(left: 24),
            onTap: () {
              controller.getBack();
            },
          ),
          centerTitle: true,
          title: Container(
              margin: getMargin(top: 20),
              child: AppbarTitle(text: "lbl_match_details".tr)),
          bottom: TabBar(
            controller: controller.tabController,
            tabs: controller.matchDetailsTabs,
            labelColor: ColorConstant.blue500,
          ),
          actions: [
            Padding(
              padding: getPadding(top: 10, right: 20),
              child: CustomImageView(
                height: 32,
                svgPath: ImageConstant.imgAddMember,
              ),
            ),
          ],
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: [
            // Competition tab
            Container(
              margin: getMargin(top: 10),
               height: 500,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: 2,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                               height: 115 * controller.listMatches.length*1.0 ,
                               child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: getPadding( left: 10),
                                    child: Text(
                                      "Round ${index+1}",
                                      style: AppStyle.txtManropeBold16,
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                        itemCount:
                                            controller.listMatches.length,
                                        physics: const NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          RoundModel model = controller
                                              .listMatches[index];
                                          return RoundLisWidget(model);
                                        },),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    // Expanded(
                    //   child: ListView.builder(
                    //       itemCount: controller.listMatchesUpcoming.length,
                    //       scrollDirection: Axis.vertical,
                    //       itemBuilder: (BuildContext context, int index) {
                    //         RoundModel model =
                    //             controller.listMatchesUpcoming[index];
                    //         return RoundLisWidget(model);
                    //       }),
                    // ),
                  ]),
            ),
            //Team Tab
            Container(
              padding: getPadding(all: 20),
              height: 500,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: controller.listMember.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            MemberModel model =
                                controller.listMember[index];
                            return MemberListWidget(model);
                          }),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

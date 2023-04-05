import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/my_match_screen/controller/my_match_controller.dart';
import 'package:bookington_v2_2/presentation/my_match_screen/models/my_match_model.dart';
import 'package:bookington_v2_2/presentation/my_match_screen/widgets/matches_list_widget.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:flutter/material.dart';

class MyMatchScreen extends GetWidget<MyMatchController> {
  const MyMatchScreen({super.key});

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
              child: AppbarTitle(text: "lbl_matches".tr)),
          bottom: TabBar(
            controller: controller.tabController,
            tabs: controller.myMatchTabs,
            labelColor: ColorConstant.blue500,
          ),
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
        body: TabBarView(
          controller: controller.tabController,
          children: [
            // Competition tab
            Container(
              padding: getPadding(top: 20),
              height: 500,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: controller.listMatchesUpcoming.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            MyMatchModel model =
                                controller.listMatchesUpcoming[index];
                            return MatchesListWidget(model);
                          }),
                    ),
                  ],),
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
                          itemCount: controller.listMatchesCompletes.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            MyMatchModel model = controller.listMatchesCompletes[index];
                            return MatchesListWidget(model);
                          }),
                    ),
                  ]),
            ),
          ],
        ),
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
      ),
    );
  }
}

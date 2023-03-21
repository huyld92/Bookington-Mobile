import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/matches_model.dart';
import 'package:bookington_v2_2/presentation/competition_details/controller/competition_details_controller.dart';
import 'package:bookington_v2_2/presentation/competition_details/widgets/matches_widget.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CompetitionDetailsScreen extends GetWidget<CompetitionDetailsController> {
  const CompetitionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: AppBar(
              backgroundColor: ColorConstant.whiteA700,
              centerTitle: true,
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
              title: Container(
                  margin: getMargin(top: 20),
                  child: Obx(() => AppbarTitle(
                        text: controller.appbarTitle.value,
                    ),
                  ),
              ),

              bottom: TabBar(
                controller: controller.tabController,
                tabs: controller.competitionTabs,
                labelColor: ColorConstant.blue500,
              ),
            ),
            body: TabBarView(
              controller: controller.tabController,
              children: [
                Center(
                  child: Text("Details"),
                ),
                Center(
                  child: Text("Teams"),
                ),
                Container(
                  padding: getPadding(all: 20),
                  height: 500,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: controller.listMatches.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                MatchesModel model =
                                controller.listMatches[index];
                                return MatchesWidget(model);
                              }),
                        ),
                      ]),
                ),

               ],
            )));
  }
}

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/competition_model.dart';
import 'package:bookington_v2_2/data/models/team_model.dart';
import 'package:bookington_v2_2/presentation/competition_screen/controller/competition_controller.dart';
import 'package:bookington_v2_2/presentation/competition_screen/widgets/competition_widget.dart';
import 'package:bookington_v2_2/presentation/competition_screen/widgets/team_widget.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class CompetitionScreen extends GetWidget<CompetitionController> {
  const CompetitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: ColorConstant.whiteA700,
          centerTitle: true,
          title: Container(
              margin: getMargin(top: 20),
              child: AppbarTitle(text: "lbl_competition".tr)),
          bottom: TabBar(
            controller: controller.tabController,
            tabs: controller.competitionTabs,
            labelColor: ColorConstant.blue500,
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: [
            // Competition tab
            Container(
              padding: getPadding(all: 20),
              height: 500,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: controller.listCompetition.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            CompetitionModel model =
                                controller.listCompetition[index];
                            return CompetitionWidget(model);
                          }),
                    ),
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
                          itemCount: controller.listTeamModel.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            TeamModel model = controller.listTeamModel[index];
                            return TeamWidget(model);
                          }),
                    ),
                  ]),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.createButton();
          },
          child: CustomImageView(
            svgPath: ImageConstant.imgBluePlus,
          ),
        ),
      ),
    );
  }
}

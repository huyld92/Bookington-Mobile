import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/team_model.dart';
import 'package:bookington_v2_2/presentation/competition_screen/controller/competition_controller.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TeamWidget extends StatelessWidget {
  TeamWidget(this.model, {super.key});

  TeamModel model;
  CompetitionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.teamDetails();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: getMargin(bottom: 10),
            padding: getPadding(all: 10),
            decoration: BoxDecoration(
                border: BorderRadiusStyle.border1Gray300,
                color: ColorConstant.whiteA700,
                boxShadow: [
                  BoxShadow(
                      color: ColorConstant.gray300,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 5),
                      blurStyle: BlurStyle.inner),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: AppStyle.txtManropeRegular16,
                    ),
                    Text(
                      model.refCompetition,
                      style: AppStyle.txtManropeRegular16,
                    ),
                  ],
                ),
                Column(
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgDelete,
                      height: 32,
                      width: 32,
                      onTap: () {
                        controller.deleteTeam();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

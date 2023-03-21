import 'package:bookington_v2_2/core/app_export.dart';
 import 'package:bookington_v2_2/data/models/competition_model.dart';
import 'package:bookington_v2_2/presentation/competition_screen/controller/competition_controller.dart';
 import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CompetitionWidget extends StatelessWidget {
  CompetitionWidget(this.model, {super.key});

  CompetitionModel model;
  CompetitionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(bottom: 20),
      padding: getPadding(all: 10),
      decoration: BoxDecoration(color: ColorConstant.whiteA700, boxShadow: [
        BoxShadow(
            color: ColorConstant.gray300,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 5),
            blurStyle: BlurStyle.inner),
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              controller.competitionDetails();
            },
            child: Column(
              children: [
                Center(
                    child: Text(model.name,
                        style: AppStyle.txtManropeBold16, maxLines: 2)),
                Padding(
                  padding: getPadding(top: 10, bottom: 10),
                  child: Text(
                      "Last date to register: ${DateFormat("dd-MM-yyyy").format(model.registerDeadline)}",
                      style: AppStyle.txtManropeBold16),
                ),
              ],
            ),
          ),
          Divider(
            color: ColorConstant.gray500,
            thickness: 1,
          ),
          Padding(
            padding: getPadding(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.shareCompetition();
                    },
                    child: CustomImageView(
                      height: 32,
                      width: 32,
                      svgPath: ImageConstant.imgShare,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.deleteCompetition();
                    },
                    child: CustomImageView(
                      height: 32,
                      width: 32,
                      svgPath: ImageConstant.imgDelete,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

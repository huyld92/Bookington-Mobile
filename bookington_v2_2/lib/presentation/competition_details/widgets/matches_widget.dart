

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/match_model.dart';
import 'package:bookington_v2_2/presentation/competition_details/controller/competition_details_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MatchWidget extends StatelessWidget{

  MatchWidget(this.matchesModel, {super.key});

  MatchModel  matchesModel;
  CompetitionDetailsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Round 1", style: AppStyle.txtManropeBold16,),
        Container(
          decoration: BoxDecoration(
              border: BorderRadiusStyle.border1Gray300
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.date();
                      },
                      child: CustomImageView(
                        height: 32,
                        width: 32,
                        svgPath: ImageConstant.imgCalendar,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.location();
                      },
                      child: CustomImageView(
                        height: 32,
                        width: 32,
                        svgPath: ImageConstant.imgLocationBlue,
                        color: ColorConstant.black900,
                      ),
                    ),
                  ),],
              ),
              Container(
                padding: getPadding(all: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                  Text("Team 1"),
                  Text("2"),
                ],),
              ),
              Container(
                padding: getPadding(all: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Team 2"),
                    Text("1"),
                  ],),
              ),
            ],
          ),
        ),
       ],
    );
  }

}
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/match_details_screen/controller/match_details_controller.dart';
import 'package:bookington_v2_2/presentation/match_details_screen/model/round_model.dart';
import 'package:flutter/material.dart';

class RoundLisWidget extends StatelessWidget {
  RoundLisWidget(this.model, {super.key});

  RoundModel model;
  MatchDetailsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.setScore(model);
      },
      child: Container(
         margin: getMargin(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("Round 1", style: AppStyle.txtManropeBold16,),
            Container(
              margin: getMargin(bottom: 10),
              decoration: BoxDecoration(border: BorderRadiusStyle.border1Gray300),
              child: Column(
                children: [
                  Container(
                    padding: getPadding(all: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Member 1"),
                        RichText(
                          text: TextSpan(
                              // text: " 29",
                              children: [
                                TextSpan(text: "  21"),
                                TextSpan(text: "  21"),
                                TextSpan(text: "  2", style: AppStyle.txtManropeBold16),
                              ],
                              style: AppStyle.txtManropeSemiBold16),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: getPadding(all: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Member 2"),
                        RichText(
                          text: TextSpan(
                            // text: " 29",
                              children: [
                                TextSpan(text: "  10"),
                                TextSpan(text: "  19"),
                                TextSpan(text: "  0", style: AppStyle.txtManropeBold16),
                              ],
                              style: AppStyle.txtManropeSemiBold16),
                          maxLines: 1,
                        ),                    ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

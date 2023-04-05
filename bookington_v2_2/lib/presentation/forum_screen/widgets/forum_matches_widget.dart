import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/forum_screen/controller/forum_controller.dart';
import 'package:bookington_v2_2/presentation/forum_screen/model/forum_match_model.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class ForumMatchWidget extends StatelessWidget {
  ForumMatchWidget(this.model, {super.key});

  ForumMatchModel model;
  ForumController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(all: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: getPadding(all: 10),
            decoration: BoxDecoration(border: BorderRadiusStyle.border1Gray300),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "CourtName",
                      style: AppStyle.txtManropeBold16,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date: 12-12-2022",
                      style: AppStyle.txtManropeBold16,
                    ),
                    Text(
                      "Time: 12:00-14:00",
                      style: AppStyle.txtManropeBold16,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Players: ",
                      style: AppStyle.txtManropeBold16,
                    ),
                    Text(
                      "3/6",
                      style: AppStyle.txtManropeSemiBold14Gray900,
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    text: "Description: ",
                    style: AppStyle.txtManropeBold14,
                    children: [
                      TextSpan(
                        text:
                            "Description: new player looking for someone to play with",
                        style: AppStyle.txtManropeSemiBold14Gray900,
                      ),
                    ],
                  ),
                  maxLines: 3,
                ),
                Container(
                  width: size.width,
                  padding: getPadding(all: 10),
                  // decoration: AppDecoration.outlineBluegray1000f,
                  child: CustomButton(
                    height: 50,
                    width:  size.width,
                    text: "lbl_join_match".tr,
                    variant: ButtonVariant.FillBlue500,
                    fontStyle: ButtonFontStyle.ManropeBold14WhiteA700,
                    onTap: () {
                      controller.joinMatch();
                    },
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

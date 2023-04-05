import 'package:bookington_v2_2/presentation/match_details_screen/model/members_model.dart';
import 'package:flutter/material.dart';

import 'package:bookington_v2_2/core/app_export.dart';

// ignore: must_be_immutable
class MemberListWidget extends StatelessWidget {
  MemberListWidget(this.model, {super.key});

  MemberModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomImageView(
                    width: 64,
                    height: 64,
                    svgPath: ImageConstant.imgUser,
                  ),
                  Text("Dao Duc Huy", style: AppStyle.txtManropeBold16),
                ],
              ),
              CustomImageView(
                width: 32,
                height: 32,
                svgPath: ImageConstant.imgChat,
              ),
            ],
          ),
          Padding(
            padding: getPadding(top: 5, left: 30),
            child: Divider(
                height: getVerticalSize(1),
                thickness: getVerticalSize(1),
                color: ColorConstant.blueGray100),
          ),
        ],
      ),
    );
  }
}

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/my_match_screen/controller/my_match_controller.dart';
import 'package:bookington_v2_2/presentation/my_match_screen/models/my_match_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MatchesListWidget extends StatelessWidget {
  MatchesListWidget(this.mode, {super.key});

  MyMatchModel mode;
  MyMatchController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.matchDetails();
      },
      child: Container(
        margin: getMargin(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Container(
              decoration: BoxDecoration(border: BorderRadiusStyle.border2Gray500),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Phu Tho Court", style: AppStyle.txtManropeBold16),
                    ],
                  ),
                  Container(
                    padding: getPadding(top: 10, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date: 01-03-2023", style: AppStyle.txtManropeSemiBold14),
                        Text("Time: 12:00-14:00", style: AppStyle.txtManropeSemiBold14),
                      ],
                    ),
                  ),
                  Container(
                    padding: getPadding(top: 10, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Main Player: Dao Duc Huy ", style: AppStyle.txtManropeSemiBold14),
                       ],
                    ),
                  ),

                  Container(
                    padding: getPadding(top: 10, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Address: 10 Ly Thuong Kiet, q11, TP.HCM", style: AppStyle.txtManropeSemiBold14),
                      ],
                    ),
                  ),

                  Container(
                    padding: getPadding(top: 10, left: 20, bottom: 10,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Number of members: 4/8", style: AppStyle.txtManropeSemiBold14),
                      ],
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

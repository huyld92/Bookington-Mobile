import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/competition_model.dart';
import 'package:bookington_v2_2/presentation/forum_screen/controller/forum_controller.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class CompetitionWidget extends StatelessWidget {
  CompetitionWidget(this.model, {super.key});

  CompetitionModel model;
  ForumController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(all: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 150,
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
                      "Players: 3/6",
                      style: AppStyle.txtManropeBold16,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Description: ",
                      style: AppStyle.txtManropeBold16,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

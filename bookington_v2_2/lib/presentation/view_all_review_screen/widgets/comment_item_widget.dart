import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/comment_model.dart';
import 'package:bookington_v2_2/presentation/view_all_review_screen/controller/view_all_review_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class CommentItemWidgets extends StatelessWidget {
  CommentItemWidgets(this.model, {super.key});

  CommentModel model;
  ViewAllCommentReviewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(top: 15, left: 15, right: 15),
      decoration: AppDecoration.fillGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipOval(
            // padding: getPadding(right: 10),
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadiusStyle.circleBorder23
            // ),
            child: Image.memory(model.commentWriter.imgBase,
                width: getSize(70), height: getSize(70),fit: BoxFit.cover,),
          ),
          Padding(
            padding: getPadding(left: 10, top: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: getHorizontalSize(230),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(model.commentWriter.fullName, style: AppStyle.txtManropeBold16, maxLines: 1),
                      Text(DateFormat("dd-MM-yyyy").format(model.createAt), style: AppStyle.txtManropeRegular14),
                    ],
                  ),
                ),
                Row(children: [
                  Text(
                    "${model.rating}".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtManropeBold14.copyWith(
                      letterSpacing: getHorizontalSize(0.20),
                      height: getVerticalSize(0.92),
                    ),
                    maxLines: 1,
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgStar,
                    height: getVerticalSize(15.00),
                    width: getHorizontalSize(10.00),
                    margin: getMargin(left: 12, top: 13, bottom: 14),
                  ),
                ]),
                Text(model.content, style: AppStyle.txtManropeSemiBold14, maxLines: 2),

              ],
            ),
          )
        ],
      ),
    );
  }
}

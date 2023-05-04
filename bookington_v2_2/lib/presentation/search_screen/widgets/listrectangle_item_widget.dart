import 'package:bookington_v2_2/presentation/search_screen/models/search_model.dart';

import '../controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';

// ignore: must_be_immutable
class ListRectangleItemWidget extends StatelessWidget {
  ListRectangleItemWidget(this.searchModel, this._index, {super.key});

  final int _index;
  final SearchModel searchModel;

  var controller = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.courtDetailsScreen(_index);
      },
      child: Container(
        margin: getMargin(bottom: 20),
        decoration: AppDecoration.fillGray300.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (searchModel.listCourtImage.isNotEmpty)
              Container(
                  width: getHorizontalSize(120),
                  padding: getPadding(all: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadiusStyle.circleBorder23,
                    child: Image.memory(searchModel.listCourtImage[0].imgBase,
                        width: getSize(120), height: getSize(120), fit: BoxFit.cover,),
                  ))
            else
              CustomImageView(
                margin: getMargin(all: 10),
                imagePath: ImageConstant.imagesPhoThoCourt,
                height: getSize(120.00),
                width: getSize(120.00),
                radius: BorderRadiusStyle.circleBorder23,
              ),
            Container(
              width: getHorizontalSize(200),
              padding: getPadding(bottom: 9),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                      child: SizedBox(
                    width: 220,
                    child: Text(
                      searchModel.name,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtManropeBold16,
                      softWrap: true,
                      maxLines: 2,
                    ),
                  )),
                  Padding(
                    padding: getPadding(top: 5),
                    child: Text(
                      "${searchModel.districtName}, ${searchModel.provinceName}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtManropeRegular14.copyWith(
                        letterSpacing: getHorizontalSize(0.20),
                      ),
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 5),
                    child: Row(
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgStar,
                          height: getSize(12.00),
                          width: getSize(12.00),
                          margin: getMargin(top: 2, bottom: 2),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 4,
                          ),
                          child: Text(
                            searchModel.ratingStar.toStringAsFixed(1),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtManropeSemiBold14.copyWith(
                              letterSpacing: getHorizontalSize(
                                0.20,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(left: 5),
                          child: Text(
                            "${searchModel.numberOfReview} ${"lbl_reviews".tr}",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtManropeRegular12.copyWith(
                              letterSpacing: getHorizontalSize(
                                0.20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 5,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${searchModel.moneyPerHour} VND",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtManropeBold20,
                          // style: AppStyle.txtUrbanistBold24Cyan600,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 5,
                          ),
                          child: Text(
                            "lbl_slot_30_min".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtManropeRegular10.copyWith(
                              letterSpacing: getHorizontalSize(
                                0.20,
                              ),
                            ),
                          ),
                        ),
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

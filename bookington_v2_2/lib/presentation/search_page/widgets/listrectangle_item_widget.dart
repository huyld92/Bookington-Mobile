import 'package:bookington_v2_2/presentation/search_page/models/search_model.dart';

import '../controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';

// ignore: must_be_immutable
class ListRectangleItemWidget extends StatelessWidget {
  ListRectangleItemWidget(this._searchModel, this._index, {super.key});

  final int _index;
  final SearchModel _searchModel;

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
            CustomImageView(
              margin: getMargin(all: 10),
              imagePath: ImageConstant.imgPhoThoCourt,
              height: getSize(120.00),
              width: getSize(120.00),
              radius: BorderRadius.circular(
                getHorizontalSize(16.00),
              ),
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
                        _searchModel.name,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtManropeBold20,
                        softWrap: true,
                        maxLines: 1,
                      ),
                   )),
                  Padding(
                    padding: getPadding(top: 5),
                    child:  Text(
                        "${_searchModel.districtName}, ${_searchModel.provinceName}",
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
                          child:  Text(
                              _searchModel.ratingStar.toString(),
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
                          child:Text(
                              "${_searchModel.numberOfReview} ${"lbl_reviews".tr}",
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
                            "${_searchModel.moneyPerHour} VND",
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

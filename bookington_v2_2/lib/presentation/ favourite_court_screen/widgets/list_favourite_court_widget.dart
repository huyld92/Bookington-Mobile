import 'package:bookington_v2_2/presentation/%20favourite_court_screen/controller/%20favourite_court_controller.dart';
import 'package:bookington_v2_2/presentation/%20favourite_court_screen/model/favorite_model.dart';

 import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';

// ignore: must_be_immutable
class ListFavouriteCourtWidget extends StatelessWidget {
  ListFavouriteCourtWidget(this._favoriteModel, this._index, {super.key});

  final int _index;
  final FavoriteModel _favoriteModel;

  var controller = Get.find<FavouriteCourtController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.courtDetailsScreen(_index);
      },
      child: Container(
        margin: getMargin(top: 15, left: 15,right: 15),
        decoration: AppDecoration.fillGray300.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImageView(
              margin: getMargin(all: 10),
              imagePath: ImageConstant.imagesPhoThoCourt,
              height: getSize(
                120.00,
              ),
              width: getSize(
                120.00,
              ),
              radius: BorderRadius.circular(
                getHorizontalSize(
                  16.00,
                ),
              ),
            ),
            Container(
              width: getHorizontalSize(200),

              padding: getPadding(
                bottom: 9,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                      child: SizedBox(
                    width: 220,
                    child: Text(
                      _favoriteModel.name,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtManropeBold20,
                      softWrap: true,
                      maxLines: 1,
                    ),
                  )),
                  Padding(
                    padding: getPadding(
                      top: 5,
                    ),
                    child: Text(
                      "${_favoriteModel.districtName}, ${_favoriteModel.provinceName}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtManropeRegular14.copyWith(
                        letterSpacing: getHorizontalSize(
                          0.20,
                        ),
                      ),
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 5,
                    ),
                    child: Row(
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgStar,
                          height: getSize(
                            12.00,
                          ),
                          width: getSize(
                            12.00,
                          ),
                          margin: getMargin(
                            top: 2,
                            bottom: 2,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 4,
                          ),
                          child: Text(
                            _favoriteModel.ratingStar.toString(),
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
                            "378 reviews".tr,
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
                          "${_favoriteModel.moneyPerHour}VND",
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
                            "lbl_hour".tr,
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

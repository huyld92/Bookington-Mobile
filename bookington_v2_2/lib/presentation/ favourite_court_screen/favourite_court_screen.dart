import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/%20favourite_court_screen/controller/%20favourite_court_controller.dart';
import 'package:bookington_v2_2/presentation/%20favourite_court_screen/model/favorite_model.dart';
import 'package:bookington_v2_2/presentation/%20favourite_court_screen/widgets/list_favourite_court_widget.dart';
 import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class FavouriteCourtScreen extends GetWidget<FavouriteCourtController> {
  const FavouriteCourtScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(80.00),
          leadingWidth: 64,
          leading: AppbarImage(
            height: getSize(64.00),
            width: getSize(64.00),
            svgPath: ImageConstant.imgArrowleft,
            margin: getMargin(left: 24),
            onTap: () {
              controller.getBack();
            },
          ),
          centerTitle: true,
          title: AppbarTitle(text: "lbl_favourite".tr),
        ),
        body: Column(
          children: [
            Container(
              padding: getPadding(top: 10, bottom: 10),
              decoration: BoxDecoration(
                border: BorderRadiusStyle.borderB2Gray500,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: getPadding(
                      left: 10,
                      bottom: 5,
                    ),
                    child: Text(
                      "${"lbl_showing_all".tr} ",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtManropeRegular14,
                    ),
                  ),
                  CustomImageView(
                    margin: getMargin(right: 10, bottom: 5),
                    svgPath: ImageConstant.imgFilter,
                    height: getSize(
                      28.00,
                    ),
                    width: getSize(
                      28.00,
                    ),
                    onTap: () {
                      print('Filter');
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: getPadding(bottom: 5),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: getVerticalSize(
                          1.00,
                        ),
                      );
                    },
                    itemCount: controller.listFavoriteMode.length,
                    itemBuilder: (context, index) {
                      FavoriteModel model = controller.listFavoriteMode[index];
                      return ListFavouriteCourtWidget(model, index);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

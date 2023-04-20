

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/transaction_screen/controller/transaction_controller.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class  TransactionHistoryEmptyWidget extends StatelessWidget{

  TransactionController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: CustomAppBar(
        height: getVerticalSize(80.00),
        leadingWidth: 64,
        leading: AppbarImage(
          height: getSize(64.00),
          width: getSize(64.00),
          svgPath: ImageConstant.imgArrowLeft,
          margin: getMargin(left: 24),
          onTap: () {
            controller.getBack();
          },
        ),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_transaction".tr),
        actions: [
          CustomImageView(
            margin: getMargin(right: 20),
            height: 32,
            svgPath: ImageConstant.imgFilter,
          )
        ],
      ),
      body: Container(
          width: size.width,
          padding: getPadding(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                  svgPath: ImageConstant.imgTransactionEmpty,
                  height: getVerticalSize(204.00),
                  width: getHorizontalSize(255.00)),
              Padding(
                  padding: getPadding(top: 20),
                  child: Text("lbl_oop".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtManropeExtraBold20Blue500.copyWith(
                          letterSpacing: getHorizontalSize(0.20),
                          height: getVerticalSize(0.99)))),
              Padding(
                  padding: getPadding(top: 15),
                  child: Text("lbl_no_data_found".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtManropeSemiBold16.copyWith(
                          letterSpacing: getHorizontalSize(0.20),
                          height: getVerticalSize(0.99)))),

            ],
          )),
    );

  }

}
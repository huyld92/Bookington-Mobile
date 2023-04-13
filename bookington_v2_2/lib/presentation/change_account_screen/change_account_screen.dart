// ignore_for_file: unused_local_variable

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/change_account_screen/controller/change_account_controller.dart';
import 'package:bookington_v2_2/presentation/change_account_screen/models/change_account_model.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_bar/custom_app_bar.dart';

class ChangeAccountScreen extends GetWidget<ChangeAccountController> {
  const ChangeAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        height: getVerticalSize(80),
        leadingWidth: 64,
        leading: AppbarImage(
          height: getVerticalSize(64),
          width: getVerticalSize(64),
          svgPath: ImageConstant.imgArrowLeft,
          margin: getMargin(left: 24),
          onTap: () {
            controller.getBack();
          },
        ),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_change_account".tr),
      ),
          body: Column(
            children: [
              Container(
                height: 40,
                width: double.maxFinite,
                color: ColorConstant.gray300,
                child: Center(child: Text("Add an account for quick login.", style: AppStyle.txtManropeMedium18,)),
              ),
              Padding(
                padding: getPadding(top: 10),
                child: Obx(
                      () => ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(5));
                    },
                    itemCount: controller.listAccountModel.length,
                    itemBuilder: (context, index) {
                      ChangeAccountModel model =
                      controller.listAccountModel[index];
                      return Padding(
                        padding: getPadding(left: 10, right: 10),
                        child: Obx(() => Row (
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CustomImageView(
                                    height: 32,
                                    width: 32,
                                    svgPath: ImageConstant.imgUser,
                                  ),
                                  Padding(
                                    padding: getPadding(all: 10),
                                    child: Text("User name", style: AppStyle.txtManropeBold16),
                                  ),
                                ],
                              ),
                              if(controller.listAccountModel[index].isLogged)
                                Text("lbl_logged".tr, style: AppStyle.txtManropeMedium14Gray700,),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              Padding(
                padding: getPadding(all: 10),
                child: Row(
                  children: [
                    CustomImageView(
                      height: 32,
                      width: 32,
                      svgPath: ImageConstant.imgBluePlus,
                    ),
                    Padding(
                      padding: getPadding(all: 10),
                      child: Text("lbl_more_account".tr,style: AppStyle.txtManropeBold16Blue500,),
                    ),
                  ],
                ),
              )
            ],
          ),
    ));
  }
}

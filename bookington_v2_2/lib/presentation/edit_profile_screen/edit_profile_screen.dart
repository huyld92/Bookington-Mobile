import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/loading_widget.dart';
import 'package:intl/intl.dart';

import 'controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:bookington_v2_2/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class EditProfileScreen extends GetWidget<EditProfileController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return SafeArea(
        top: false,
        bottom: false,
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            // resizeToAvoidBottomInset: false,

            appBar: CustomAppBar(
                height: getVerticalSize(80.00),
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
                title: AppbarTitle(text: "lbl_edit_profile".tr)),
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  width: size.width,
                  padding: getPadding(left: 24, top: 32, right: 24, bottom: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: getSize(100.00),
                          width: getSize(100.00),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              controller.editProfileModelObj.value.accountModel
                                      .imgBase.isNotEmpty
                                  ? Obx(() => Container(
                                        padding: getPadding(right: 10),
                                        child: ClipOval(
                                          child: Image.memory(
                                              controller.editProfileModelObj
                                                  .value.accountModel.imgBase,
                                              width: getSize(70),
                                              height: getSize(70),
                                              fit: BoxFit.cover),
                                        ),
                                      ))
                                  : CustomImageView(
                                      svgPath: ImageConstant.imgUser,
                                      height: getSize(75.00),
                                      width: getSize(75.00),
                                      radius: BorderRadius.circular(
                                          getHorizontalSize(50.00)),
                                      alignment: Alignment.center),
                              Positioned(
                                top: 60,
                                right: 0,
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgEdit,
                                  height: getSize(32.00),
                                  width: getSize(32.00),
                                  // color: ColorConstant.blue500,
                                  radius: BorderRadius.circular(
                                      getHorizontalSize(50.00)),
                                  alignment: Alignment.center,
                                  onTap: () {
                                    controller.updateAvatar();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: getPadding(top: 33),
                          child: Text("lbl_full_name".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtManropeMedium12.copyWith(
                                  letterSpacing: getHorizontalSize(0.40)))),
                      CustomTextFormField(
                        width: getHorizontalSize(327),
                        focusNode: FocusNode(),
                        controller: controller.fullNameController,
                        hintText: "lbl_enter_full_name".tr,
                        margin: getMargin(top: 7),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Full name cannot empty";
                          } else if (value.length > 50) {
                            return "Maximum 50 characters";
                          }
                          return null;
                        },
                      ),
                      Padding(
                          padding: getPadding(top: 17),
                          child: Text("lbl_birthday".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtManropeMedium12.copyWith(
                                  letterSpacing: getHorizontalSize(0.40)))),
                      Obx(
                        () => TextButton.icon(
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(color: ColorConstant.black900),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusStyle.circleBorder23,
                            ),
                          ),
                          onPressed: () {
                            controller.presentDatePicker();
                          },
                          icon: CustomImageView(
                              height: 32,
                              width: 32,
                              svgPath: ImageConstant.imgCalendar,
                              color: ColorConstant.black900),
                          label: Text(
                            DateFormat('dd-MM-yyyy')
                                .format(controller.selectedDate.value),
                            style: AppStyle.txtManropeSemiBold20,
                          ),
                        ),
                      ),
                      // Padding(
                      //     padding: getPadding(top: 33),
                      //     child: Text("lbl_description".tr,
                      //         overflow: TextOverflow.ellipsis,
                      //         textAlign: TextAlign.left,
                      //         style: AppStyle.txtManropeMedium12.copyWith(
                      //             letterSpacing: getHorizontalSize(0.40)))),
                      // CustomTextFormField(
                      //     width: size.width,
                      //     maxLines: 6,
                      //      focusNode: FocusNode(),
                      //     controller: controller.descriptionController,
                      //     hintText: "lbl_description".tr,
                      //     margin: getMargin(top: 7),
                      //
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              width: size.width,
              padding: getPadding(all: 24),
              decoration: AppDecoration.outlineBluegray1000f,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomButton(
                    height: 56,
                    width: 327,
                    text: "lbl_save_change".tr,
                    variant: ButtonVariant.FillBlue500,
                    fontStyle: ButtonFontStyle.ManropeBold16,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        controller.updateProfile();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }, onLoading: const LoadingWidget());
  }
}

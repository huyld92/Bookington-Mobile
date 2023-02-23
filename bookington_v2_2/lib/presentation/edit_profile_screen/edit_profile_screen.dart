import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';

import 'controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/core/utils/validation_functions.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_iconbutton.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:bookington_v2_2/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class EditProfileScreen extends GetWidget<EditProfileController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(40.00),
                leadingWidth: 64,
                leading: AppbarIconbutton(
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24),
                    onTap: controller.getBack()),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_edit_profile".tr)),
            body: Form(
                key: _formKey,
                child: Container(
                    width: size.width,
                    padding:
                        getPadding(left: 24, top: 32, right: 24, bottom: 32),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  height: getSize(100.00),
                                  width: getSize(100.00),
                                  child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgUser,
                                            height: getSize(100.00),
                                            width: getSize(100.00),
                                            radius: BorderRadius.circular(
                                                getHorizontalSize(50.00)),
                                            alignment: Alignment.center),
                                        // CustomIconButton(
                                        //     height: 24,
                                        //     width: 24,
                                        //     variant:
                                        //         IconButtonVariant.OutlineGray50,
                                        //     padding:
                                        //         IconButtonPadding.PaddingAll6,
                                        //     alignment: Alignment.bottomRight,
                                        //     child: CustomImageView(
                                        //         svgPath: ImageConstant.imgEdit))
                                      ]))),
                          Padding(
                              padding: getPadding(top: 33),
                              child: Text("lbl_full_name".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtManropeMedium12.copyWith(
                                      letterSpacing: getHorizontalSize(0.40)))),
                          CustomTextFormField(
                              width: 327,
                              focusNode: FocusNode(),
                              controller: controller.fullNameController,
                              hintText: "lbl_enter_full_name".tr,
                              margin: getMargin(top: 7)),
                          Padding(
                              padding: getPadding(top: 17),
                              child: Text("lbl_phone".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtManropeMedium12.copyWith(
                                      letterSpacing: getHorizontalSize(0.40)))),
                          CustomTextFormField(
                              width: 327,
                              focusNode: FocusNode(),
                              controller: controller.phoneController,
                              hintText: "msg_enter_your_phone".tr,
                              margin: getMargin(top: 7),
                              textInputType: TextInputType.phone,
                              validator: (value) {
                                if (value == null ||
                                    (!isValidPhone(value, isRequired: true))) {
                                  return "Please enter valid phone";
                                }
                                return null;
                              }),
                          Padding(
                              padding: getPadding(top: 17),
                              child: Text("lbl_birthday".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtManropeMedium12.copyWith(
                                      letterSpacing: getHorizontalSize(0.40)))),
                          CustomTextFormField(
                              width: 327,
                              focusNode: FocusNode(),
                              controller: controller.birthdayController,
                              hintText: "lbl_select_date".tr,
                              margin: getMargin(top: 7)),
                        ]))),
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
                          fontStyle: ButtonFontStyle.ManropeBold16)
                    ]))));
  }

}

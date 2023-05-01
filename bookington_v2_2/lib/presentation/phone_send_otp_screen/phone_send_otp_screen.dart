import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/core/utils/validation_functions.dart';
import 'package:bookington_v2_2/presentation/phone_send_otp_screen/controller/phone_send_otp_controller.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:bookington_v2_2/widgets/custom_text_form_field.dart';
import 'package:bookington_v2_2/widgets/loading_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PhoneSendOtpScreen extends GetWidget<PhoneSendOtpController> {
  PhoneSendOtpScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  controller.obx(
          (state) {return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
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
            title: AppbarTitle(text: "Bookington".tr),
          ),
          body:SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Container(
                  width: size.width,
                  height: size.height - 22,
                  decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: getMargin(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: ColorConstant.blue300,
                                ),
                                child: Center(
                                  child: Text(
                                    "1",
                                    style: AppStyle.txtManropeBold14WhiteA700,
                                  ),
                                )),
                            Container(
                                width: 32,
                                height: 32,
                                margin: getMargin(left: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: ColorConstant.gray300,
                                ),
                                child: Center(
                                  child:
                                      Text("2", style: AppStyle.txtManropeBold14),
                                )),
                            Container(
                              width: 32,
                              height: 32,
                              margin: getMargin(left: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: ColorConstant.gray300,
                              ),
                              child: Center(
                                child:
                                    Text("3", style: AppStyle.txtManropeBold14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: getMargin(top: 50),
                        child: Text(
                          "lbl_reset_password".tr,
                          style: AppStyle.txtManropeExtraBold24,
                        ),
                      ),
                      Container(
                        height: 80,
                        width: getHorizontalSize(310),
                        margin: getMargin(top: 50, left: 20, right: 20),

                        child: CustomTextFormField(
                          width: 310,
                          focusNode: FocusNode(),
                          controller: controller.txtPhoneController,
                          hintText: "msg_enter_your_phone".tr,
                          variant: TextFormFieldVariant.OutlineGray300,
                          padding: TextFormFieldPadding.PaddingT14L20,
                          textInputAction: TextInputAction.none,
                          textInputType: TextInputType.phone,
                          suffixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(40.00)),
                          suffix: CustomImageView(
                            width: 64,
                            margin: getMargin(all: 10),
                            color: ColorConstant.gray500,
                            svgPath: ImageConstant.imgCancel,
                            onTap: () {
                              controller.txtPhoneController.clear();
                            },
                          ),
                          validator: (value) {
                            if (value == null ||
                                (!isValidPhone(value, isRequired: true))) {
                              return "Please enter valid phone";
                            }
                            return null;
                          },
                        ),
                      ),
                      CustomButton(
                        height: 55,
                        width: 310,
                        margin: getMargin(top: 20),
                        text: "lbl_next".tr,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            controller.sendOtp();
                          }
                        },
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: getPadding(top: 20, bottom: 5),
                          child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "msg_don_t_have_an_account2".tr,
                                      style: AppStyle.txtManropeSemiBold14),
                                  TextSpan(
                                    text: "lbl_register_now".tr,
                                    style:
                                        AppStyle.txtManropeSemiBold14IndigoA200,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        controller.registrationPhoneScreen();
                                      },
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),
          ),
        ),
      );},
      onLoading: const LoadingWidget()
    );
  }
}

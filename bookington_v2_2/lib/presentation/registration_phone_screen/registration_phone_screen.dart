import 'controller/registration_phone_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:bookington_v2_2/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class RegistrationPhoneScreen extends GetWidget<RegistrationPhoneController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: Form(
                key: _formKey,
                child: Container(
                    width: size.width,
                    padding: getPadding(left: 16, right: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: getHorizontalSize(350.00),
                              child: Text("lbl_bookington".tr,
                                  maxLines: null,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.txtManropeExtraBold24
                                      .copyWith(
                                          letterSpacing:
                                              getHorizontalSize(0.72),
                                          height: getVerticalSize(1.22)))),
                          CustomTextFormField(
                              width: 358,
                              focusNode: FocusNode(),
                              controller: controller.txtPhone,
                              hintText: "msg_enter_your_phone".tr,
                              margin: getMargin(top: 37),
                              textInputType: TextInputType.phone,
                               ),
                          //login button
                          CustomButton(
                            height: 53,
                            width: 358,
                            text: "lbl_next".tr,
                            margin: getMargin(top: 24),
                            onTap: () {
                              print("Next registration phone screen button");
                              // Get.toNamed(AppRoutes.verifyPhoneNumberScreen);
                              controller.registrationWithPhone();
                            },
                          ),

                        ])))));
  }
}

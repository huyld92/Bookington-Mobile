import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:bookington_v2_2/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../controller/court_details_controller.dart';

class ReportCourtWidget extends StatelessWidget {
  CourtDetailsController controller = Get.find();

  ReportCourtWidget({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SingleChildScrollView(
        child: Container(
          height: getVerticalSize(320),
          padding: getPadding(bottom: 30),
          decoration: BoxDecoration(color: ColorConstant.whiteA700),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: getPadding(bottom: 20),
                        child: Text(
                          'lbl_report'.tr,
                          style: AppStyle.txtManropeExtraBold18,
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: controller.reportContentController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'msg_report_content'.tr,
                          ),
                          maxLengthEnforcement:
                              MaxLengthEnforcement.truncateAfterCompositionEnds,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(200),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Content cannot empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    height: 48,
                    width: size.width / 3,
                    text: "lbl_cancel".tr,
                    padding: ButtonPadding.PaddingAll12,
                    variant: ButtonVariant.FillGray300,
                    onTap: () {
                      controller.reportContentController.clear();
                      controller.getBack();
                    },
                  ),
                  CustomButton(
                    margin: getMargin(left: 20),
                    height: getSize(48),
                    width: size.width / 3,
                    text: "lbl_submit".tr,
                    padding: ButtonPadding.PaddingAll12,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        controller.reportCourt();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

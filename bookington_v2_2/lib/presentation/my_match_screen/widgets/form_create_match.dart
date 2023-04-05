import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/my_match_screen/controller/my_match_controller.dart';
import 'package:bookington_v2_2/widgets/custom_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ForumCreateMatch extends StatelessWidget {
  ForumCreateMatch({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  MyMatchController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: GestureDetector(
        onTap: () {
           FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
           margin: MediaQuery.of(context).viewInsets,
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Container(
                  width: 253,
                  margin: getMargin(top:20),
                  decoration: BoxDecoration(
                      border: BorderRadiusStyle.border2Gray500,
                      borderRadius: BorderRadiusStyle.roundedBorder10),
                  child: TextField(
                    controller: controller.matchNameController,
                    focusNode: FocusNode(),
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: 'lbl_match_name'.tr,
                      fillColor: ColorConstant.whiteA700,
                      contentPadding:
                          getPadding(left: 20, top: 5, bottom: 5, right: 20),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                    style: AppStyle.txtManropeRegular14,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) {
                      FocusManager.instance.primaryFocus?.unfocus();
                     },
                  ),
                ),
              ),
              Padding(
                padding: getPadding(top: 10),
                child: Row(
                  children: [
                    Text("Number of players: ", style: AppStyle.txtManropeBold16),
                    Text(" 2", style: AppStyle.txtManropeBold16),
                    Text(" 4", style: AppStyle.txtManropeBold16),
                    Text(" 6", style: AppStyle.txtManropeBold16),

                   ],
                ),
              ),
              const Text("Split cost"),
               Padding(
                padding: getPadding(top: 10),
                child: Row(
                  children: [
                    Text("Number of round: ", style: AppStyle.txtManropeBold16),
                    Text(" 3", style: AppStyle.txtManropeBold16),
                    Text(" 5", style: AppStyle.txtManropeBold16),
                    Text(" 7", style: AppStyle.txtManropeBold16),

                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    height: 55,
                    width: 100,
                    text: "lbl_cancel".tr,
                    margin: getMargin(top: 20, right: 20),

                    onTap: () async {
                      Get.back();
                    },
                  ),
                  CustomButton(
                    height: 55,
                    width: 140,
                    text: "lbl_create_match".tr,
                    margin: getMargin(top: 20),
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        controller.createMatchDialog();
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

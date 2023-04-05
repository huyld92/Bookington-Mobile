import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/presentation/report_screen/controller/report_controller.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_image.dart';
import 'package:bookington_v2_2/widgets/app_bar/appbar_title.dart';
import 'package:bookington_v2_2/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ReportScreen extends GetWidget<ReportController> {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
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
          title: AppbarTitle(text: "lbl_report".tr)),
    ));
  }
}

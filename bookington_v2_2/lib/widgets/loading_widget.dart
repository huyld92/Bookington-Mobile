

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget{
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.whiteA700,
      padding: getPadding(top: 50),
      child: Center(
          child: Column(
            children: [
              Padding(
                padding: getPadding(right: 10),
                child: const CircularProgressIndicator(),
              ),
              Padding(
                padding: getPadding(top: 20),
                child: Text("loading....", style: AppStyle.txtManropeSemiBold16),
              ),
            ],
          )),
    );
  }

}
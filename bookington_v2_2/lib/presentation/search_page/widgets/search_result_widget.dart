import 'package:bookington_v2_2/presentation/search_page/models/search_model.dart';

import '../controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';

import 'listrectangle_item_widget.dart';

// ignore: must_be_immutable
class SearchResultWidget extends StatelessWidget {
  SearchResultWidget(this.controller, {super.key});

  SearchController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Padding(
          padding: getPadding(
            left: 0,
            top: 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(
                  top: 20,
                  right: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 2,
                        bottom: 3,
                      ),
                      child: Text(
                        "${"lbl_result".tr}(${controller.totalCount.value})",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtManropeBold18,
                      ),
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgFilter,
                      height: getSize(
                        28.00,
                      ),
                      width: getSize(
                        28.00,
                      ),
                      onTap: () {
                        print('Filter');
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(bottom: 20),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: getVerticalSize(
                        20.00,
                      ),
                    );
                  },
                  itemCount: controller.listSearchMode.length,
                  itemBuilder: (context, index) {
                    SearchModel model = controller.listSearchMode[index];
                    return ListRectangleItemWidget(model,index);
                  },
                ),
              ),
            ],
          )),
    );
  }
}

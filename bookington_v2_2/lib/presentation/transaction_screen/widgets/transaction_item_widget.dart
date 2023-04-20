// ignore_for_file: avoid_print

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/transaction_model.dart';
import 'package:bookington_v2_2/presentation/transaction_screen/controller/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class TransactionItemWidget extends StatelessWidget {
  TransactionItemWidget(this.model, this.index, {super.key});

  int index;
  TransactionModel model;
  TransactionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('transaction detail');
      },
      child: Container(
        padding: getPadding(all: 10),
        child: Column(
          children: [
            Container(
              width: size.width,
              padding: getPadding(top: 1),
              child: Text(
                model.reason,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtManropeMedium16Black900,
                maxLines: 3,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: getPadding(top: 10),
                  child: Text(DateFormat("dd-MM-yyyy").format(model.createAt),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtManropeRegular14),
                ),
                controller.checkAddBalance(model.refTo)
                    ? Padding(
                        padding: getPadding(bottom: 1),
                        child: Text("+${model.amount}".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtManropeMedium16Green600))
                    : Padding(
                        padding: getPadding(bottom: 1),
                        child: Text("-${model.amount}".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtManropeMedium16Red700))
              ],
            ),
            Padding(
                padding: getPadding(top: 10),
                child: Divider(
                    height: getVerticalSize(1),
                    thickness: getVerticalSize(1),
                    color: ColorConstant.blueGray100)),
          ],
        ),
      ),
    );
  }
}

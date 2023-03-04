import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/voucher_model.dart';
import 'package:bookington_v2_2/presentation/choose_voucher_screen/controller/voucher_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListVoucherItemWidget extends GetView<VoucherController> {
  ListVoucherItemWidget(this.model, this.index, {super.key});

  VoucherModel model;
  int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: getPadding(left: 15, top: 15, right: 15, bottom: 15),
        decoration: BoxDecoration(
          border: BorderRadiusStyle.border2Gray500,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(left: 12, top: 2, bottom: 2),
                  child: Text(model.title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtManropeBold18),
                ),
                Padding(
                  padding: getPadding(left: 12, top: 2, bottom: 2),
                  child: Text(
                      'EXP: ${DateFormat("dd.MM.yyyy").format(model.end_date)}',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtManropeBold18),
                ),
                Container(
                  margin: getMargin(left: 12, top: 2, bottom: 2),
                  padding: getPadding(left: 5, right: 5),
                  decoration: BoxDecoration(
                    border: BorderRadiusStyle.border2Red500
                  ),
                  child: Text(
                      ' ${model.discount.toStringAsFixed(0)}%',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtManropeBold18Red500),
                ),
              ],
            ),
            Obx(
              () => Radio<String>(
                value: model.id,
                groupValue: controller.selectedVoucher.value,
                onChanged: (value) {
                  print(model.title);
                  controller.selectedVoucher(value);
                },
              ),
            )
          ],
        ),
      ),
      onTap: () {
        controller.changeVoucher(index);
      },
    );
  }
}

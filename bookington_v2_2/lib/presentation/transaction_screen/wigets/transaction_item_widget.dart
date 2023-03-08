import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/transaction_model.dart';
import 'package:bookington_v2_2/presentation/transaction_screen/models/transaction_model_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class TransactionItemWidget extends StatelessWidget {
  TransactionItemWidget(this.model, this.index, {super.key});

  int index;
  TransactionModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('transaction detail');
      },
      child: Container(
        color: index % 2 == 0 ? ColorConstant.gray300 : ColorConstant.whiteA700,
        padding: getPadding(all: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Reson", style: AppStyle.txtManropeBold16),
                Text("- ${model.amount}", style: AppStyle.txtManropeBold16)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(DateFormat("dd-MM-yyyy").format(model.createAt), style: AppStyle.txtManropeSemiBold14),
                // Text("Payment", style: AppStyle.txtManropeSemiBold14) //type
              ],
            ),
          ],
        ),
      ),
    );
  }
}

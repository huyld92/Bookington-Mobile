import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionItemWidget extends StatelessWidget {
  TransactionItemWidget(this.model,this.index, {super.key});

  int index;
  TransactionModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index % 2== 0 ?ColorConstant.gray300: ColorConstant.whiteA700,
      padding: getPadding(all: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Booking Phu Tho Court", style: AppStyle.txtManropeBold16),
              Text("- 100,000", style: AppStyle.txtManropeBold16)
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("22-01-2022",
                  style: AppStyle.txtManropeSemiBold14),
              Text("Payment", style: AppStyle.txtManropeSemiBold14) //type
            ],
          ),
        ],
      ),
    );
  }

}
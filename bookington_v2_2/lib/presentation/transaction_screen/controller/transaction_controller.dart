

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/transaction_model.dart';

class TransactionController extends GetxController{

  RxList<TransactionModel> listTrasaction = RxList.filled(20, TransactionModel(
    "Booking Phu Tho court","100,000","22-11-2022","Payment"
  ));

  getBack() {
    print('Transaction getback');

  }


}
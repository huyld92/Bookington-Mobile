

import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/transaction_model.dart';
import 'package:bookington_v2_2/presentation/transaction_screen/models/transaction_model_screen.dart';

class TransactionController extends GetxController{

  RxList<TransactionModelScreen> listTransaction = RxList.filled(20, TransactionModelScreen(
    "Booking Phu Tho court","100,000","22-11-2022","Payment"
  ));

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  getBack() {
    Get.back();
  }

  void loadData() {
    ApiClient.getTransactionHistory().then((result) {
      print('statusCode: ${result.statusCode}');
      if(result.statusCode == 200){

        print(jsonDecode(result.body));
      } else{
        print('errror');
      }
    });
  }


}
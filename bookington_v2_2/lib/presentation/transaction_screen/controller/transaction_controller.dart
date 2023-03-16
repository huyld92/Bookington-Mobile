import 'dart:convert';

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/apiClient/api_client.dart';
import 'package:bookington_v2_2/data/models/transaction_model.dart';
import 'package:bookington_v2_2/presentation/profile_screen/controller/profile_controller.dart';

class TransactionController extends GetxController with StateMixin,ScrollMixin{
  RxList<TransactionModel> listTransactionObj = <TransactionModel>[].obs;


  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  getBack() {
    Get.back();
  }

  void loadData() {
    getTransactionHistory();
  }

  getTransactionHistory(){
    ApiClient.getTransactionHistory().then((result) {
      print('statusCode: ${result.statusCode}');
      if (result.statusCode == 200) {
        List<TransactionModel> listTransaction =
        TransactionModel.listNameFromJson(
            jsonDecode(result.body)["result"]);
        listTransactionObj.value = listTransaction;

        listTransactionObj.refresh();
      } else if(result.statusCode == 401 || result.statusCode == 403){
        ProfileController profileController = Get.find();
        Map<String, bool> arg = {"timeOut": true};
        profileController.logout(arg);
      }else {
        print('errror');
      }
    });
  }

  @override
  Future<void> onEndScroll() async {

  }

  @override
  Future<void> onTopScroll() async {
  }
}

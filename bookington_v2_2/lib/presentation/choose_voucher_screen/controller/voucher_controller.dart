import 'dart:convert';

 import 'package:bookington_v2_2/data/models/voucher_model.dart';
 import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VoucherController extends GetxController {
  TextEditingController voucherController = TextEditingController();
  RxList<VoucherModel> listVoucherMode = [
    VoucherModel(
        "1",
        "2",
        "3",
        "AAAAAAAA",
        "Voucher 1",
        "_description",
        10,
        20,
        10,
        DateFormat("dd/MM/yyyy").parse("12/12/2022"),
        DateFormat("dd/MM/yyyy").parse("15/12/2022"),
        DateFormat("dd/MM/yyyy").parse("12/12/2022"),
        true),
    VoucherModel(
        "2",
        "2",
        "3",
        "BBBBBBB",
        "Voucher 2",
        "_description",
        10,
        20,
        10,
        DateFormat("dd/MM/yyyy").parse("12/12/2022"),
        DateFormat("dd/MM/yyyy").parse("15/12/2022"),
        DateFormat("dd/MM/yyyy").parse("12/12/2022"),
        true),
    VoucherModel(
        "3",
        "2",
        "3",
        "CCCCCC",
        "Voucher 3",
        "_description",
        10,
        20,
        10,
        DateFormat("dd/MM/yyyy").parse("12/12/2022"),
        DateFormat("dd/MM/yyyy").parse("15/12/2022"),
        DateFormat("dd/MM/yyyy").parse("12/12/2022"),
        true),
  ].obs;
  RxString selectedVoucher = "1".obs;

  @override
  void onInit() {
    var voucher = Get.arguments;
    if (voucher['courtID'] != null) {
      selectedVoucher.value = voucher['id'];
      String courtID = voucher['courtID'];
      loadData(courtID);
    }

    super.onInit();
  }

  @override
  void onClose() {
    voucherController.dispose();
    super.onClose();
  }
  void loadData(String courtID) {
    //
    // ApiClient.getAllVoucherOfCourt(courtID).then((result) {
    //   if (result.statusCode == 200) {
    //     VoucherModel voucher =
    //     VoucherModel.fromJson(jsonDecode(result.body)["result"]);
    //   } else if(result.statusCode == 401 || result.statusCode == 403){
    //     ProfileController profileController = Get.find();
    //     profileController.logout();
    //   }else {
    //     print('ERRRRRRRRR');
    //   }
    // });

  }

  void getBack() {
    if(selectedVoucher.value == "-1"){
      selectedVoucher.value = "";
    }
    Map<String, String> backValue = {
      'id': selectedVoucher.value,
    };
    Get.back(result: backValue);
  }

  void changeVoucher(int index) {
    if (selectedVoucher.value == listVoucherMode[index].id) {
      selectedVoucher.value = "-1";
    } else {
      selectedVoucher.value = listVoucherMode[index].id;
    }
  }
}

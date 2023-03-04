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
    if(voucher['id'] != null){
      selectedVoucher.value = voucher['id'];
    }

    super.onInit();
  }
  void getBack() {
    Map<String,String> backValue = {
      'id':selectedVoucher.value,
    };
    Get.back(result: backValue);
  }

  void changeVoucher(int index) {
    selectedVoucher.value = listVoucherMode[index].id;
  }
}

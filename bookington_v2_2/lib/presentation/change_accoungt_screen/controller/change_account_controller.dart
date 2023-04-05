import 'package:bookington_v2_2/core/app_export.dart';
import 'package:bookington_v2_2/data/models/account_model.dart';
import 'package:bookington_v2_2/presentation/change_accoungt_screen/models/change_account_model.dart';
import 'package:intl/intl.dart';

class ChangeAccountController extends GetxController {
  RxList<ChangeAccountModel> listAccountModel = RxList.filled(
      2,
      // AccountModel(
      //     "_id",
      //     "_roleId",
      //     "_phone",
      //     "_password",
      //     "_fullName",
      //     DateFormat("dd-MM-yyyy").parse("01-01-2022"),
      //     DateFormat("dd-MM-yyyy").parse("01-01-2022"),
      //     true)
      ChangeAccountModel("id", "phone", "fullName", true, "imageUrl")
  );

  void getBack() {
    Get.back();
  }
}

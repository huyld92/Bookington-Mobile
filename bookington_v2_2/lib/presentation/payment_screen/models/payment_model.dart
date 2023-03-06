import 'package:bookington_v2_2/data/models/booking_model.dart';
import 'package:get/get.dart';

class PaymentModel {
  // RxList<ListcheckinItemModel> listcheckinItemList =
  //     RxList.filled(2, ListcheckinItemModel());
  RxList<BookingModel>? listBooking = <BookingModel>[].obs;
}

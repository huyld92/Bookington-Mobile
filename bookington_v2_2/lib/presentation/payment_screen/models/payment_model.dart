import 'package:bookington_v2_2/data/models/booking_model.dart';
import 'package:bookington_v2_2/data/models/slot_model.dart';
import 'package:get/get.dart';

class PaymentModel {
  List<BookingModel> listBooking = <BookingModel>[].obs;
  List<SlotModel> listSlotBooking = <SlotModel>[].obs;

  // List<BookingModel>? listBooking;
  late String totalHour;

  PaymentModel(this.listBooking, this.listSlotBooking) {
    totalHour = ((listSlotBooking.length * 30) / 60).toString();
  }

  PaymentModel.empty() {
    totalHour = "";
  }
}

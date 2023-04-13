import 'package:bookington_v2_2/data/models/booking_model.dart';
import 'package:bookington_v2_2/data/models/slot_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PaymentModel {

  List<BookingModel> listBooking = <BookingModel>[].obs;
  List<SlotModel> listSlotBooking = <SlotModel>[].obs;
  // List<BookingModel>? listBooking;

  PaymentModel(
      this.listBooking, this.listSlotBooking );

  PaymentModel.empty();

}

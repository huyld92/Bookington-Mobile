import 'package:bookington_v2_2/data/models/booking_model.dart';
import 'package:bookington_v2_2/data/models/slot_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PaymentModel {
  late String courtName="";
  late DateTime created= DateTime.now();
  late DateTime playDate= DateTime.now();
  late String from="";
  late String totalHours="";
  late String orderId = "";
  List<SlotModel> listSlotBooking = <SlotModel>[].obs;
  // List<BookingModel>? listBooking;

  PaymentModel(
      this.courtName, this.created, this.from, this.totalHours);

  PaymentModel.empty();

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        json["courtName"],
        DateFormat("dd-MM-yyyy").parse(json["created"]),
        json["from"],
        json["totalHours"],
      );
}

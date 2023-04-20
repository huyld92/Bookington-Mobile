import 'package:bookington_v2_2/data/models/booking_history_model.dart';
import 'package:intl/intl.dart';

class BookingHistoryScreenModel {
  late String courtName;
  late String subCourtName;
  late String playDate;
  late String startTime;
  late String endTime;
  late String totalHour;
  late String status;

  BookingHistoryScreenModel(BookingHistoryModel bookingHistoryModel) {
    courtName = bookingHistoryModel.courtName;
    subCourtName = bookingHistoryModel.subCourtName;
    playDate = DateFormat("dd-MM-yyyy").format(bookingHistoryModel.playDate);
    startTime = DateFormat("HH:mm").format(bookingHistoryModel.startTime);
    endTime = DateFormat("HH:mm").format(bookingHistoryModel.endTime);
    status = bookingHistoryModel.status;

    totalHour = (((bookingHistoryModel.endTime.hour * 60 +
                    bookingHistoryModel.endTime.minute) -
                (bookingHistoryModel.startTime.hour * 60 -
                    bookingHistoryModel.startTime.minute)) /
            60).toString();
   }

  BookingHistoryScreenModel.empty() {
    courtName = "";
    subCourtName = "";
    playDate = "";
    startTime = "";
    endTime = "";
    status = "";
    totalHour = "";
  }
}




// ignore_for_file: non_constant_identifier_names

class MatchModel{

  String id;
  String  host_by;
  String ref_booking ;
  int numOfPlayersAllowed;
  int numOfRounds;
  String matchCode;
  bool isPaymentSplitted;

  MatchModel(
      this.id,
      this.host_by,
      this.ref_booking,
      this.numOfPlayersAllowed,
      this.numOfRounds,
      this.matchCode,
      this.isPaymentSplitted);
}
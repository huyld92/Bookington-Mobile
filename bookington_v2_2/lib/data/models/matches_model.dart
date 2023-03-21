


class MatchesModel{

  String id;
  String  host_by;
  String ref_booking ;
  int numOfPlayersAllowed;
  int numOfRounds;
  String matchCode;
  bool isPaymentSplitted;

  MatchesModel(
      this.id,
      this.host_by,
      this.ref_booking,
      this.numOfPlayersAllowed,
      this.numOfRounds,
      this.matchCode,
      this.isPaymentSplitted);
}
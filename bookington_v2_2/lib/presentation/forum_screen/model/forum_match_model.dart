

class ForumMatchModel{
  String courtName;
  DateTime startDate;
  DateTime startTime;
  DateTime endDate;
  int numOfPlayersAllowed;
  String description;
  bool isSharePayment;

  ForumMatchModel(this.courtName, this.startDate, this.startTime, this.endDate,
      this.numOfPlayersAllowed, this.description, this.isSharePayment);
}
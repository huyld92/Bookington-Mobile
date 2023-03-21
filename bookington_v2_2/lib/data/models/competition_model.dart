

class CompetitionModel{
  String id;
  String hostBy;
  String name;
  String description;
  String competitionCode;
  int numOfTeamsAllowed;
  DateTime startTime;
  DateTime endTime;
  DateTime registerDeadline;
  bool isActive;

  CompetitionModel(
      this.id,
      this.hostBy,
      this.name,
      this.description,
      this.competitionCode,
      this.numOfTeamsAllowed,
      this.startTime,
      this.endTime,
      this.registerDeadline,
      this.isActive);
}
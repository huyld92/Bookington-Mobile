class QueryModel {
  String searchText;
  String district;
  String province;
  String playDate;
  String playTime;
  int pageNumber;
  int maxPageSize;

  QueryModel(
      {required this.searchText,
      required this.district,
      required this.province,
      required this.playDate,
      required this.playTime,
      required this.pageNumber,
      required this.maxPageSize});
}

import 'package:bookington_v2_2/data/models/court_images.dart';
import 'package:bookington_v2_2/data/models/court_model.dart';

class RecommendItemModel {
  late CourtModel court;
  late CourtImage courtImage;
  late String rating;

  RecommendItemModel();
  RecommendItemModel.full({required this.court, required this.courtImage, required this.rating});

}

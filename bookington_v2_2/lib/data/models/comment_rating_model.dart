class CommentRatingModel {
  late String commentWriterId;
  late String refCourt;
  late String content;
  late double rating;

  CommentRatingModel(
      this.commentWriterId, this.refCourt, this.content, this.rating);
  CommentRatingModel.empty(){
    commentWriterId = "";
    refCourt = "";
    content = "";
    rating = 0.0;
  }
}

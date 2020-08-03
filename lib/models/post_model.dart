class PostModel {
  String title;
  String id;
  String date;
  String description;
  String shortDescription;
  String imgUrl;
  String downloadLink;
  List<ReatedPostModel> relatedPost;
  PostModel.formJson(Map map) {
    this.title = map['title']['rendered'];
    this.id = map['id'].toString();
    this.date = map['date'];
    this.description = map['content']['rendered'];
    this.imgUrl = map['jetpack_featured_media_url'];
    this.downloadLink = map['jetpack_featured_media_url'];
    this.shortDescription = map['excerpt']['rendered'];
    this.relatedPost = List<ReatedPostModel>.from(
        map['jetpack-related-posts'].map((x) => ReatedPostModel.formJson(x)));
  }
}

class ReatedPostModel {
  String id;
  String date;
  String title;
  String shortDescription;
  String imgUrl;
  ReatedPostModel.formJson(Map map) {
    this.id = map['id'].toString();
    this.title = map['title'];
    this.date = map['date'];
    this.imgUrl = map['img']['src'];
    this.shortDescription = map['excerpt'];
  }
}

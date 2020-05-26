class PostModel {
  String title;
  String id;
  String date;
  String description;
  String shortDescription;
  String imgUrl;
  String downloadLink;
  PostModel.formJson(Map map) {
    this.title = map['title']['rendered'];
    this.id = map['id'].toString();
    this.date = map['date'];
    this.description = map['content']['rendered'];
    this.imgUrl = map['jetpack_featured_media_url'];
    this.downloadLink = map['jetpack_featured_media_url'];
    this.shortDescription = map['excerpt']['rendered'];
  }
}

class ProductCategories{
  var title;
  var image;
  var user;
  var categoryId;
  var createdAt;
  var updatedAt;


  ProductCategories(this.title, this.image, this.user, this.categoryId,
      this.createdAt, this.updatedAt);

  ProductCategories.fromJson(Map json){
    this.title=json["title"];
    this.image=json["image"];
    this.user=json["user"];
    this.categoryId=json["categoryId"];
    this.createdAt=json["createdAt"];
    this.updatedAt=json["updatedAt"];
  }

  Map toJson(){
    return {
      "title":title,
      "image":image,
      "user":user,
      "categoryId":categoryId,
      "createdAt":createdAt,
      "updatedAt":updatedAt,
    };
  }
}
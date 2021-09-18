class Products{
  var id;
  var image;
  var name_tr;
  var price;
  var comment_tr;


  Products(this.id, this.image, this.name_tr, this.price, this.comment_tr);

  Products.fromJson(Map json){
    this.id=json["id"];
    this.image=json["image"];
    this.name_tr=json["name_tr"];
    this.price=json["price"];
    this.comment_tr=json["comment_tr"];
  }

  Map toJson(){
    return {
      "id":id,
      "image":image,
      "name_tr":name_tr,
      "price":price,
      "comment_tr":comment_tr,
    };
  }
}
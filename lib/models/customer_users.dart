class CustomerUsers{
  var id;
  var name;
  var create_date;
  var email;
  var email_confirm_code;
  var phone;
  var phone_confirm_code;
  var address_id;
  var language_id;

  CustomerUsers(
      this.id,
      this.name,
      this.create_date,
      this.email,
      this.email_confirm_code,
      this.phone,
      this.phone_confirm_code,
      this.address_id,
      this.language_id
  );

  CustomerUsers.fromJson(Map json){
    this.id=json["id"];
    this.name=json["name"];
    this.create_date=json["create_date"];
    this.email=json["email"];
    this.email_confirm_code=json["email_confirm_code"];
    this.phone=json["phone"];
    this.phone_confirm_code=json["phone_confirm_code"];
    this.address_id=json["address_id"];
    this.language_id=json["language_id"];
  }

  Map toJson(){
    return {
      "id":id,
      "name":name,
      "create_date":create_date,
      "email":email,
      "email_confirm_code":email_confirm_code,
      "phone":phone,
      "phone_confirm_code":phone_confirm_code,
      "address_id":address_id,
      "language_id":language_id,
    };
  }
}
import 'dart:convert';
import 'package:digigarson_demo/models/product_categories.dart';
import 'package:digigarson_demo/models/products.dart';
import 'package:http/http.dart' as http;

class Service {
  String url="http://api.digigarson.net/api/";

  Future<List<ProductCategories>> fetchDataCategories() async {
    List<ProductCategories> _categories=[];
    String path=url+"categories";
    final http.Response response = await http.get(
      Uri.parse(path)
    );
    if (response.statusCode == 200) {
      final bodyResponse=jsonDecode(response.body);
      if(bodyResponse is List){
        _categories=bodyResponse.map((e) => ProductCategories.fromJson(e)).toList();
      }
      return _categories;

    } else {
      throw Exception(
        "İstek durumu başarısız oldu: ${response.statusCode}",
      );
    }
  }

  Future<List<Products>> fetchDataProducts(var categoryId) async {
    List<Products> _products=[];
    String path=url+"products?categoryId"+categoryId;
    final http.Response response = await http.get(
        Uri.parse(path)
    );
    if (response.statusCode == 200) {
      final bodyResponse=jsonDecode(response.body);
      if(bodyResponse is List){
        _products=bodyResponse.map((e) => Products.fromJson(e)).toList();
      }
      return _products;

    } else {
      throw Exception(
        "İstek durumu başarısız oldu: ${response.statusCode}",
      );
    }
  }
}
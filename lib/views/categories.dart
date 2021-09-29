//@dart=2.9
import 'package:digigarson_demo/components/category_card.dart';
import 'package:digigarson_demo/models/product_categories.dart';
import 'package:digigarson_demo/models/session.dart';
import 'package:digigarson_demo/services/in_app_service.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  //Session session;
  //Categories(this.session);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List<ProductCategories> _future;
  List<ProductCategories> values=[];
  InAppService apiManager=InAppService();

  @override
  void initState(){
    listData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(1),
      crossAxisSpacing: 6,
      mainAxisSpacing: 6,
      crossAxisCount: 2,
      children: List.generate(values.length, (index){
        return CategoryCard(values[index].title,values[index].categoryId);
      }),
    );
  }

  void listData() async{
    _future=await apiManager.fetchDataCategories();
    setState(() {
      values=_future;
    });
  }
}







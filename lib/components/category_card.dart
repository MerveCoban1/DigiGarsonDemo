import 'package:flutter/material.dart';
import 'package:digigarson_demo/views/products_for_categories.dart';

class CategoryCard extends StatefulWidget {
  var categoryName;
  var categoryId;

  CategoryCard(this.categoryName, this.categoryId);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsForCategories(widget.categoryName,widget.categoryId)));
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 180,
              height: 140.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://cdn.pixabay.com/photo/2016/02/05/15/34/pasta-1181189_960_720.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              widget.categoryName,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.red[400],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4.0,
              spreadRadius:
              2.0, //yayılma yarıçapı, bu değer ne kadar artarsa gölge de o kadar geniş bir alana yayılır.
            ),
          ],
        ),
      ),
    );
  }
}

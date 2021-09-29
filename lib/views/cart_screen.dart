import 'package:digigarson_demo/database//database_helper.dart';
import 'package:digigarson_demo/models/cart.dart';
import 'package:digigarson_demo/models/session.dart';
import 'package:flutter/material.dart';

import 'cart_detail.dart';

class CartScreen extends StatefulWidget {
  //Session session;
  //CartScreen(this.session);
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var databaseHelper;
  var cartValue;
  int cartCount=0;
  late Widget widgetToDisplay;

  @override
  void initState() {
    widgetToDisplay=noneProductWidget();
    databaseHelper=new DatabaseHelper();
    getCart();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        availableProductWidget(),
        SizedBox(height: 20.0,),
        InkWell(
          onTap: (){
            //bu veriler sunucudaki veritabanına kaydedilecek.
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.red[400],
              ),
              child: Center(
                child: Text(
                  "Alışverişi Tamamla",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget availableProductWidget() {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 400.0,
          child: ListView.builder(
            itemCount: cartCount,
            itemBuilder: (BuildContext context,int index){
              return cartItem(this.cartValue[index]);
            },
          ),
        ),
      ),
    );
  }

  Widget noneProductWidget() {
    return Center(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart),
            SizedBox(height: 15.0),
            Text(
              "Sepetinizde ürün bulunmamaktadır",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile cartItem(Cart cart) {
    return ListTile(
      leading: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                cart.productImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      title: Text(cart.productName),
      subtitle: Text("${cart.quantity.toString()} adet"),
      trailing: Text("${cart.productPrice.toString()} TL",style: TextStyle(color: Colors.red[400]),),
      onTap: (){
        goToDetail(cart);
      },
    );
  }

  void getCart() async{
    var cartFuture=await databaseHelper.getCarts(); //oluşturduğum cart tablosundaki tüm veriler gelecek
    setState(() {
      this.cartValue=cartFuture;
      cartCount=cartFuture.length;
      if(cartCount==0){
        widgetToDisplay=noneProductWidget();
      }else{
        widgetToDisplay=availableProductWidget();
      }
    });

  }

  void goToDetail(Cart cart) async{
    bool result=await Navigator.push(context,MaterialPageRoute(builder: (context) => CartDetail(cart)));
    if(result){
      getCart();
    }
  }
}

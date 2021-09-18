import 'package:digigarson_demo/database//database_helper.dart';
import 'package:digigarson_demo/models/cart.dart';
import 'package:flutter/material.dart';

class CartDetail extends StatefulWidget {
  Cart cart;
  var databaseHelper=DatabaseHelper();
  CartDetail(this.cart);

  @override
  _CartDetailState createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Hero(
                tag: "deneme",
                child: Image.network(
                    widget.cart.productImage),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.red[400],
                  size: 40.0,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          Column(
            //column yatay eksende varsayılan olarak ortaya hizalanır.
            children: [
              SizedBox(height: 20.0),
              Text(
                widget.cart.productName,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "${widget.cart.productPrice} TL",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[400],
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                child: Text(
                  "${widget.cart.quantity} adet",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              InkWell(
                onTap: (){
                  //addToCart();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width-50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: true ? Colors.red[400]:Colors.black,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Center(
                    child: Text(
                      true ? "Sepete Ekle" : "Stokta yok",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  //void addToCart() async{
    //await widget.databaseHelper.insert(Cart(widget.productId,widget.productName,widget.image,1,widget.productPrice));
    //print("productId: ${widget.productId}   productName:${widget.productName}   image:${widget.image}   productPrice:${widget.productPrice}");
    //Navigator.pop(context,true);
  //}
}

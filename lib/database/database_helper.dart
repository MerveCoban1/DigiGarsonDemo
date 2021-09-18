import 'dart:async';
import 'package:digigarson_demo/models/cart.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  var _db;
  Future<Database> get db async {
    if (_db == null) {
      _db= await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async{
    String dbPath=join(await getDatabasesPath(),"digigarsondemo.db");  //sqflite veritabanı yollarını veriyor.
    var eTradeDb=await openDatabase(dbPath,version: 1,onCreate: createDb);  //aç veritabanını yoksa oluştur.
    return eTradeDb;
  }

  void createDb(Database db, int version) {
    db.execute("Create table cart(productId integer primary key, productName text, productImage text, quantity text,productPrice integer)");
  }

  Future<List<Cart>> getCarts() async{
    Database db =await this.db;
    var result=await db.query("cart");  //bu tablodaki tüm verileri çektik.
    return List.generate(result.length,(i){
      return Cart.fromObject(result[i]);
    });
  }

  Future<int> insert(Cart cart) async{
    Database db=await this.db;
    var result= await db.insert("cart", cart.toMap());
    return result;
  }

  Future<int> delete(int productId) async{
    Database db=await this.db;
    var result= await db.rawDelete("delete from cart where productId=$productId");
    return result;
  }

  Future<int> update(Cart cart) async{
    Database db=await this.db;
    var result= await db.update("cart",cart.toMap(),where: "productId=?",whereArgs: [cart.productId]);
    return result;
  }

}
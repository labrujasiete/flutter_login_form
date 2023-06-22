import 'package:flutter/material.dart';
import 'package:products_app/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class ProductsService extends ChangeNotifier{

  final String _baseUrl = 'flutter-varios-df825-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  bool isLoading = true;

  ProductsService(){
    loadProducts();
  }


  Future<List<Product>> loadProducts() async {

    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'Products.json');
    final resp = await http.get( url );

    final Map<String, dynamic> productsMap = json.decode( resp.body );
    
    //print(productsMap);
    
    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap( value );
      tempProduct.id = key;
      products.add(tempProduct);
    });

    //isLoading = false;
    notifyListeners();

    return products;

  }

}
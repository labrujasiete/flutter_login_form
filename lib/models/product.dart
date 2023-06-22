// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class Product {
    bool available;
    String name;
    String? picture;
    double price;
    String? id;

    Product({
        required this.available,
        required this.name,
        this.picture,
        required this.price,
    });

    // Crear una instancia del producto probeniente de la base de datos
    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    //Enviar ala base de datos
    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"]?.toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
    };
}

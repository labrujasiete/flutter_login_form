import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:products_app/widgets/widgets.dart';
import 'package:products_app/services/services.dart';

class HomeScreen extends StatelessWidget {
     
  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      // ListView.builder() will lazy create only the items that 
      // are visible
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: ( _, int index ) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'product'),
          child: ProductCard()
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){}
      ),
    );
  }
}
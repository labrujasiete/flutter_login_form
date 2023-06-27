import 'package:flutter/material.dart';
import 'package:products_app/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:products_app/widgets/widgets.dart';
import 'package:products_app/services/services.dart';

class HomeScreen extends StatelessWidget {
     
  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);

    if( productsService.isLoading ) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      // ListView.builder() will lazy create only the items that 
      // are visible
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder: ( _, int index ) => GestureDetector(
          onTap: () {
            productsService.selectedProduct = productsService.products[index].copy();
            Navigator.pushNamed(context, 'product');
          },
          child: ProductCard(
            product: productsService.products[index],
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){}
      ),
    );
  }
}
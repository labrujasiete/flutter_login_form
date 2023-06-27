import 'package:flutter/material.dart';
import 'package:products_app/providers/product_form_provider.dart';
import 'package:products_app/services/products_service.dart';
import 'package:products_app/ui/input_decoration.dart';
import 'package:products_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductsService>(context);

    //return _ProductScreenBody(productService: productService);

    return ChangeNotifierProvider(
      create: ( _ ) => ProductFormProvider(productService.selectedProduct),
      child: _ProductScreenBody(productService: productService),
    );

  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    super.key,
    required this.productService,
  });

  final ProductsService productService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [

                ProductImage( url: productService.selectedProduct?.picture,),

                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new, size: 40, color: Colors.white,),
                  )
                ),

                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    onPressed: () {
                      //TODO: camara o galeria
                    },
                    icon: const Icon(Icons.camera_alt_outlined, size: 40, color: Colors.white,),
                  )
                ),
              
              ],
            ),

            _ProductForm(),

            SizedBox(height: 100),

          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.save_outlined),
        onPressed: (){

        }
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [

              SizedBox(height: 10,),

              TextFormField(
                initialValue: product!.name,
                onChanged: ( value ) => product.name = value,
                validator: ( value ) {
                  if ( value == null || value.length < 1 )
                    return 'El nombre es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(hintText: 'Nombre del producto', labelText: 'Nombre'),
              ),

              SizedBox( height: 30,),

              TextFormField(
                initialValue: '${product.price}',
                onChanged: ( value ) {
                  if ( double.tryParse(value) == null ){
                    product.price = 0;
                  } else {
                    product.price = double.parse(value);
                  }
                },
                decoration: InputDecorations.authInputDecoration(hintText: '\$150', labelText: 'Precio'),
                keyboardType: TextInputType.number,
              ),

              SizedBox( height: 30,),

              SwitchListTile(
                value: product.available,
                title: const Text('Disponible'),
                activeColor: Colors.indigo,
                onChanged: ( value ){

                }
              )

            ],
          )
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(color: Colors.white,
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: Offset(0, 5),
        blurRadius: 5
      )
    ]
  );
}
import 'package:flutter/material.dart';
import 'package:products_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [

                ProductImage(),

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
                      //TODO:
                    },
                    icon: const Icon(Icons.camera_alt_outlined, size: 40, color: Colors.white,),
                  )
                ),
              
              ],
            )
          ],
        ),
      ),
    );
  }
}
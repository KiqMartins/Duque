import 'package:flutter/material.dart';
import 'package:duque_v1/products/product.dart';



class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPage();
}

class _ProductPage extends State<ProductPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children : <Widget>[
          product('001', 'Celular Preto', context),
          product('002', 'Celular Marrom', context),
        ]
      )
    );
  }
}

// FloatingActionButton(onPressed: (){},
//               backgroundColor: mainGreen,
//               child: const Icon(Icons.add))
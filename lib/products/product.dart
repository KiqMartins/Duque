import 'package:duque_v1/widgets/inputs_text.dart';
import 'package:flutter/material.dart';

Widget product(productCode, productName, context)
{
  return SizedBox(
    height: 50,
    child: ListTile(
      title: Text('$productCode - $productName',
      style: TextStyle(
        color: mainGreen,
        fontWeight: FontWeight.bold,
        fontSize: 20
      )),
      onTap: (){
         showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              scrollable: true,
              title: const Text('Editar'),
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Código',
                          icon: Icon(Icons.numbers),
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                          icon: Icon(Icons.shopping_bag),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            );
          }
         );
      },
    )
  );
}
import 'package:duque_v1/marketplaces/mercado_livre_screen.dart';
import 'package:duque_v1/marketplaces/shopee.dart';
import 'package:duque_v1/widgets/inputs_text.dart';
import 'package:flutter/material.dart';
import 'package:duque_v1/widgets/transitions.dart';
class MarketPlacesPage extends StatelessWidget {
  const MarketPlacesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhite,
      body: Column(
        children:  [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap:(){
                Navigator.of(context).push(transition(const MercadoLivreScreen())
                );
              },
              child: Container(
                decoration:  BoxDecoration(
                  border: Border.all(
                    color: mainWhite,
                    width: 5),
                  image: const DecorationImage(
                    colorFilter: 
                      ColorFilter.mode(Colors.black, 
                      BlendMode.dstOver),
                    image: AssetImage('assets/images/ML_logo.jpg'),
                      fit: BoxFit.cover
                    )       
                   ),
              ),
            )
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(transition(const ShopeeScreen())
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: mainWhite,
                    width: 5),
                  image: const DecorationImage(
                    colorFilter: 
                      ColorFilter.mode(Colors.black, 
                      BlendMode.dstOver),
                    image: AssetImage('assets/images/Shopee_logo.jpg'),
                      fit: BoxFit.cover
                    )       
                   ),
              ),
            )
          ),
        ],
      )
    );
  }
}
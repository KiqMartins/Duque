import 'package:flutter/material.dart';
import 'package:duque_v1/widgets/inputs_text.dart';

class AboutMeScreen extends StatelessWidget {
  AboutMeScreen({super.key});
  
  Color mainGray = const Color.fromARGB(255, 36, 35, 35);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
        backgroundColor: mainGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tema escolhido:',
                  style: TextStyle(
                    color: mainGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 22)),
              ],
            ),
            Text(
                  'Calculadora para Marketplaces',
                  style: TextStyle(
                    color: mainGray,
                    fontWeight: FontWeight.bold,
                    fontSize: 22)
            ),
            const SizedBox(height: 20,),
            Text(
                  'Objetivo:',
                  style: TextStyle(
                    color: mainGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 22)
            ),
            Text(
                  'Criar uma solução de precificação de produtos para os principais'
                  ' Marketplaces do mercado',
                  style: TextStyle(
                    color: mainGray,
                    fontWeight: FontWeight.bold,
                    fontSize: 22)
            ),
            const SizedBox(height: 20,),
            Text(
                  'Desenvolvedor:',
                  style: TextStyle(
                    color: mainGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 22)
            ),
            const Text(
                  'Caique Martins',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22)
            ),
            const SizedBox(height: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: SizedBox.fromSize(
                size: const Size.fromRadius(120),
                child: Image.asset('assets/images/caique.jpg')
              )
            ),
          ],
        )
      )
    );
  }
}
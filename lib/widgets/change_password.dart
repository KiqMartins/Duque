import 'package:flutter/material.dart';
import 'package:duque_v1/widgets/inputs_text.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               basicInput('nova senha', passwordIcon, true),
               const SizedBox(height: 50),
               basicInput('digite novamente', passwordIcon, true),
               const SizedBox(height: 50),
               ElevatedButton(onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('loginPage')
                );
               },
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainGreen,
                  padding: const EdgeInsets.fromLTRB(30,15,30,15)
                ),
                child: const Text('Alterar'))
            ],
          ),
        )
      )
    );

  }
}

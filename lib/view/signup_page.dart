import 'package:duque_v1/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:duque_v1/widgets/inputs_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: mainWhite,
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          Text(
            'Cadastre-se',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: mainGreen,
              fontSize: 40
            )
          ),
          const SizedBox(height: 30),
          basicInput(
            'nome completo', 
            emailIcon,
            false
          ),
          const Divider(),
          basicInput(
            'e-mail', 
            emailIcon,
            false
          ),
          const Divider(),
          basicInput(
            'senha', 
            passwordIcon, 
            true
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: () {
              Navigator.pop(
                context, 
                MaterialPageRoute(builder: (context) => const LoginPage())
              );
            },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                backgroundColor: mainGreen
              ),
              child: const Text(
                'Cadastrar'
              )
          )
          ]
        ),
      ),
    );
  }
}



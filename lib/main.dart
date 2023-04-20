import 'package:flutter/material.dart';
import 'package:duque_v1/view/login_page.dart';
import 'package:duque_v1/view/signup_page.dart';
import 'package:duque_v1/view/menu_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Duque',

    initialRoute: 'loginPage',
    routes: {
      'loginPage': (context) => const LoginPage(),
      'signUpPage':(context) => const SignUpPage(),
      'menuPage': (context) => const MenuPage()
      },
    )
  ); 
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
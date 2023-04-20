import 'package:duque_v1/view/password_recover.dart';
import 'package:duque_v1/view/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:duque_v1/widgets/inputs_text.dart';
import 'package:duque_v1/view/menu_page.dart';
import 'package:duque_v1/widgets/transitions.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  Color mainGreen = const Color.fromARGB(255, 73, 111, 93);
  Color mainWhite = const Color.fromARGB(255, 223, 221, 221);
  
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhite,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox.fromSize(
                size: const Size.fromRadius(60),
                child: Image.asset('assets/images/duque_image.png')
              ),
              const SizedBox(height: 10),
              Form(
                child: Column(
                  children: [
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      activeColor: mainWhite,
                      checkColor: mainGreen,
                      side: MaterialStateBorderSide.resolveWith((states) => 
                        BorderSide(
                          color: mainGreen, 
                          width: 2.0)),
                      value: isChecked,
                      onChanged: (bool? value){
                        setState(() {
                          isChecked = value!;
                          }
                       );
                      }, 
                    ),
                  Text(
                    'mantenha-me conectado',
                    style: 
                      TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: mainGreen
                        )
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(transition(const MenuPage())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    backgroundColor: mainGreen,
                  ),
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: mainWhite,
                      fontSize: 15
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PasswordRecover()) 
                      );
                    },
                    child: const Text(
                      'Esqueci minha senha',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 63, 62, 62),
                        fontSize: 12
                      )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Ainda não se cadastrou? ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        )
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUpPage())
                          );
                        },
                        child: Text(
                          'Crie uma conta',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: mainGreen,
                            fontSize: 15
                          ),
                        ),
                      ),
                    ],
                  ),
                ]
              ),
            )
          ],
        )
      )
    );
  }
}

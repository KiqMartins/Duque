import 'package:flutter/material.dart';
import 'package:duque_v1/widgets/inputs_text.dart';
import 'package:duque_v1/widgets/recovery_psw_numbers.dart';

class PasswordRecover extends StatefulWidget {
  const PasswordRecover({super.key});

  @override
  State<PasswordRecover> createState() => _PasswordRecover();
}

class _PasswordRecover extends State<PasswordRecover> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhite,
      body: Padding(
        padding: const EdgeInsets.all(40), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Primeiro, digite seu e-mail:',
                    style: TextStyle(
                      color: mainGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 35
                    )
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    textAlignVertical: TextAlignVertical.bottom,
                    maxLines: 1,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainGreen)
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainGreen) 
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainGreen)
                      )
                    )
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  InputRecoveryNumbers()
                      ) 
                      );
                    },
                    child: Icon(
                      Icons.arrow_forward, 
                      color: mainGreen, 
                      size: 70))
                ]  
              ),
            )
          ]
        ),
      )
    );
  }
}
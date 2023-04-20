import 'package:duque_v1/widgets/inputs_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:duque_v1/widgets/change_password.dart';

class InputRecoveryNumbers extends StatelessWidget {
  InputRecoveryNumbers({super.key});

  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key, 
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enviamos um código no seu e-mail.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: mainGreen,
                    fontSize: 35
                  ),
                )
              ],
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  otpBox(context),
                  const SizedBox(width: 10),
                  otpBox(context),
                  const SizedBox(width: 10),
                  otpBox(context),
                  const SizedBox(width: 10),
                  otpBox(context),
                  const SizedBox(width: 10)
                ],
              ),
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      if(_key.currentState!.validate()){
                        Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => const ChangePassword())
                        );
                      }   
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                      backgroundColor: mainGreen,
                    ), child: Text(
                      'Prosseguir',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: mainWhite
                      )
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  final snackBar = SnackBar(
                    content: const Text('Novo código enviado!'),
                    action: SnackBarAction(
                      label: 'fechar',
                      onPressed: (){
                      },
                    )
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text(
                      'enviar novamente',
                      style:TextStyle(
                        color: Color.fromARGB(200, 36, 36, 36),
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                  )
                ),
              )
            ],
          ),
        )
      )
    );
  }
}

  
Widget otpBox(currentContext){

  return SizedBox(
    height: 68,
    width: 64,
    child: TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty){
          return '';
        }
        return null;
      },
      onChanged: (value) {
        if(value.length == 1){
          FocusScope.of(currentContext).nextFocus();
        }
      },
      style: Theme.of(currentContext).textTheme.titleLarge,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
       decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: mainGreen, width: 5)
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: mainGreen, width: 5) 
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: mainGreen, width: 5)
          )
        ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly
      ],
    )
  );
}





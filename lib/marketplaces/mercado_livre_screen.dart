import 'package:flutter/material.dart';
import 'package:duque_v1/widgets/inputs_text.dart';

class MercadoLivreScreen extends StatefulWidget {
  const MercadoLivreScreen({super.key});

  @override
  State<MercadoLivreScreen> createState() => _MercadoLivreScreen(); 
}

class _MercadoLivreScreen extends State<MercadoLivreScreen> {

  var hashtagIcon = Icon(Icons.numbers, color: mlColor);
  var moneyIcon = Icon(Icons.monetization_on, color: mlColor);
  var percentageIcon = Icon(Icons.percent, color: mlColor,);

  var lucroType = '';

  bool isPercentageChecked = true;
  bool isAmountChecked = false;

  @override
  Widget build(BuildContext context) {
    
    lucroType = isPercentageChecked ? 'R\$' : '%';
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mercado Livre'),
        backgroundColor: mlColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                mlInput('cód', hashtagIcon, 200, '', '', 4),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                mlInput('custo', moneyIcon, 150,'R\$ ', '', 4),
                const SizedBox(width: 15,),
                mlInput('taxa', percentageIcon, 120,'', '%', 2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                percentageIcon,
                Checkbox(
                  activeColor: mainWhite,
                  checkColor: mlColor,
                  side: MaterialStateBorderSide.resolveWith((states) => 
                    BorderSide(
                      color: mlColor, 
                      width: 2.0)
                  ),
                  value: isAmountChecked,
                  shape:const CircleBorder(),
                  onChanged: (bool? value){
                    setState(() {
                      isAmountChecked = value!;
                      isPercentageChecked = !isAmountChecked;
                      }
                    );
                  }, 
                fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return mlColor;
                    }
                    return mlColor;
                  })
                ),
                Checkbox(
                  checkColor: mlColor,
                  side: MaterialStateBorderSide.resolveWith((states) => 
                    BorderSide(
                      color: mlColor, 
                      width: 2.0)),
                  value: isPercentageChecked,
                  shape:const CircleBorder(),
                  onChanged: (bool? value){
                    setState(() {
                      isPercentageChecked = value!;
                      isAmountChecked = !isPercentageChecked;
                      }
                    );
                  }, 
                  fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return mlColor;
                      }
                      return mlColor;
                    }
                  )
                ),
                moneyIcon
              ],
            ),  
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 140.toDouble(),
                  child: TextFormField(
                keyboardType: TextInputType.number,
                maxLength: isAmountChecked ? 2 : 4,
                maxLines: 1,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'lucro',
                  border: InputBorder.none,
                  prefixIcon: moneyIcon,
                  suffixText: isAmountChecked ? '%' : '',
                  prefixText: isPercentageChecked ? 'R\$ ' : '',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: mlColor, width: 3.0)
                      ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: mlColor, width: 5.0)
                  )
                    )
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(80, 15, 80, 15),
                    backgroundColor: mlColor,
                  ),
                  child: const Text(
                    'Calcular',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:Colors.white,
                      fontSize: 17
                      ),
                  ),
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200.toDouble(),
                  child: TextFormField(
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    maxLength: isAmountChecked ? 2 : 4,
                    maxLines: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: '',
                      //border: InputBorder.none,
                      prefixText: '',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: mlColor, width: 5.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: mlColor, width: 5.0)
                      )
                    )
                  ),
                ),
              ],
            )
          ],
        )
      )
    );
  }
}

Widget mlInput(inputText, iconName, boxSize, prefix, suffix, lengthLimit){

  return SizedBox(
    width: boxSize.toDouble(),
    child: TextFormField(
      keyboardType: TextInputType.number,
      maxLength: lengthLimit,
      maxLines: 1,
      decoration: InputDecoration(
        counterText: '',
        hintText: inputText,
        border: InputBorder.none,
        prefixIcon: iconName,
        suffixText: suffix,
        prefixText: prefix,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: mlColor, width: 3.0)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: mlColor, width: 5.0)
        )
      )
    ),
  );
  
}


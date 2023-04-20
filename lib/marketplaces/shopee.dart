import 'package:flutter/material.dart';
import 'package:duque_v1/widgets/inputs_text.dart';

const List<String> saleOptions = ['Padrão', 'Frete Grátis'];

class ShopeeScreen extends StatefulWidget {
  const ShopeeScreen({super.key});

  @override
  State<ShopeeScreen> createState() => _ShopeeScreen(); 
}

class _ShopeeScreen extends State<ShopeeScreen> {

  var hashtagIcon = Icon(Icons.numbers, color: shopeeColor);
  var moneyIcon = Icon(Icons.monetization_on, color: shopeeColor);
  var percentageIcon = Icon(Icons.percent, color: shopeeColor,);

  var lucroType = '';

  bool isPercentageChecked = true;
  bool isAmountChecked = false;

  @override
  Widget build(BuildContext context) {
    
    lucroType = isPercentageChecked ? 'R\$' : '%';
    String dropdownValue = saleOptions.first;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopee'),
        backgroundColor: shopeeColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                shopeeInput('cód', hashtagIcon, 200, '', '', 4),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                shopeeInput('custo', moneyIcon, 150,'R\$ ', '', 4),
                const SizedBox(width: 25,),
                SizedBox(
                  width: 150,
                  child: DropdownButtonFormField<String>(
                    style:  const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                    iconEnabledColor: shopeeColor,
                    iconDisabledColor: shopeeColor,
                    dropdownColor: shopeeColor,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder( 
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: shopeeColor, width: 3.0)
                      ) ,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: shopeeColor, width: 3.0))
                    ),
                    value: dropdownValue,
                    onChanged: (String? value){
                      setState((){
                        dropdownValue = value!;
                      });
                    },
                    items: saleOptions.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String> (
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                percentageIcon,
                Checkbox(
                  activeColor: mainWhite,
                  checkColor: shopeeColor,
                  side: MaterialStateBorderSide.resolveWith((states) => 
                    BorderSide(
                      color: shopeeColor, 
                      width: 2.0)),
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
                    return shopeeColor;
                  }
                  return shopeeColor;
                })
            ),
                Checkbox(
                  checkColor: shopeeColor,
                  side: MaterialStateBorderSide.resolveWith((states) => 
                    BorderSide(
                      color: shopeeColor, 
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
                        return shopeeColor;
                      }
                      return shopeeColor;
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
                  prefixText: isPercentageChecked ? 'R\$ ' : '',/////////////////
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: shopeeColor, width: 3.0)
                      ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: shopeeColor, width: 5.0)
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
                    backgroundColor: shopeeColor,
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
            const SizedBox(height: 30,),
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
                      prefixText: '',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: shopeeColor, width: 5.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: shopeeColor, width: 5.0)
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

Widget shopeeInput(inputText, iconName, boxSize, prefix, suffix, lengthLimit){

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
          borderSide: BorderSide(color: shopeeColor, width: 3.0)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: shopeeColor, width: 5.0)
        )
      )
    ),
  );
}
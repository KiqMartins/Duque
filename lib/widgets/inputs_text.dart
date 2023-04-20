import 'package:flutter/material.dart';

Color mainGreen = const Color.fromARGB(255, 73, 111, 93);
Color mainWhite = const Color.fromARGB(255, 223, 221, 221);

Color mlColor = const Color.fromARGB(255, 250, 236, 13);
Color shopeeColor = const Color.fromARGB(255, 254, 87, 34);

var emailIcon = Icon(Icons.email, color: mainGreen);
var passwordIcon = Icon(Icons.password, color: mainGreen);
var personIcon = Icon(Icons.person, color: mainGreen);


Widget basicInput(inputText, iconName, coverText){

  return TextFormField(
    obscureText: coverText,
    maxLines: 1,
    decoration: InputDecoration(
      hintText: inputText,
      border: InputBorder.none,
      prefixIcon: iconName,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: mainGreen, width: 2.0)
      )
    )
  );
}
import 'package:flutter/material.dart';
import 'model/carro.dart';
import 'view/lista_carro.dart';

void main() {
  runApp((MaterialApp(
    theme: ThemeData(
        primaryColor: Colors.green[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent)),
    home: Home(),
  )));
}

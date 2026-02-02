import 'package:currency_converter/currency_converter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    home: CurrencyConverter() //ID called
    );
  }
}

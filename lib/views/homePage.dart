import 'package:flutter/material.dart';
import '../components/grocery.dart'; // Adjust the import path

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Grocery(),
    );
  }
}

import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _OrderState();
}

class _OrderState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Order Page")));
  }
}

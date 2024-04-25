import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatelessWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Currency Converter",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.blue[500],
        centerTitle: true,
      ),
      body: const Center(
        child: Text("jdoos gang"),
      ),
      bottomNavigationBar: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      
        children: [Text("home"), Text("not"), Text("setting")],
      ),
    );
  }
}

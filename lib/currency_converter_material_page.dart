import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatelessWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  // BuildContext let your widget be know is available
  Widget build(BuildContext context) {
    // custom border
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(5),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text(
          "Currency Converter",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.blue[500],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "0",
              style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: "please enter the amount in  USD",
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: const Icon(
                    Icons.monetization_on_outlined,
                  ),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Text("home"), Text("not"), Text("setting")],
      ),
    );
  }
}

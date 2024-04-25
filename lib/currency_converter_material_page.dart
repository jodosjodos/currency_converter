import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  TextEditingController txControl = TextEditingController();
  double convertedRwf = 0;
  String currencyType = "RWF";
  List<String> currencies = ["RWF", "EUR", "JPY", "GBP", "CAD", "CHF"];

  handleConverter() {
    double amount = double.tryParse(txControl.text) ?? 0;
    double rate = 1288.55;
    switch (currencyType) {
      case "RWF":
        rate = 1288.55;
        break;
      case "EUR":
        rate = 0.93;
        break;
      case "JPY":
        rate = 155.56;
        break;
      case "GBP":
        rate = 0.80;
        break;
      case "CAD":
        rate = 1.37;
        break;
      case "CHF":
        rate = 0.91;
        break;
      default:
        rate = 1288.5;
    }
    setState(() {
      convertedRwf = amount * rate;
    });
  }

  final border = OutlineInputBorder(
    borderSide: const BorderSide(
      width: 2.0,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.circular(5),
  );
  @override
  void dispose() {
    txControl.dispose();
    super.dispose();
  }

  @override
  // BuildContext let your widget be know is available
  Widget build(BuildContext context) {
    // custom setS

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text(
          "Currency Converter",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  "${convertedRwf.toStringAsFixed(2)} ",
                  style: const TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                Text(
                  currencyType,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: txControl,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: "please enter the amount in  USD",
                  hintStyle: TextStyle(
                    color: Colors.grey[800],
                  ),
                  prefixIcon: const Icon(
                    Icons.monetization_on_outlined,
                  ),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  border: border,
                  focusedBorder: border,
                  enabledBorder: border.copyWith(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blue)),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                value: currencyType,
                icon: const Icon(Icons.keyboard_arrow_down),
                decoration: InputDecoration(
                  hintText: "Select type of currency you want ",
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                items: currencies
                    .map(
                      (String currency) => DropdownMenuItem(
                        value: currency,
                        child: Text(currency),
                      ),
                    )
                    .toList(),
                onChanged: (String? selectedVal) {
                  setState(() {
                    currencyType = selectedVal ?? "RWF";
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextButton(
                onPressed: handleConverter,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text("convert"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

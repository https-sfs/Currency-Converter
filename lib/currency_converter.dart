import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});    //Widget ID

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();  //Creates State Object
}

class _CurrencyConverterState extends State<CurrencyConverter> { //State class

  final Map<String, double> rates = {  
    'USD': 82.0,
    'INR': 1.0,
    'EUR': 0.92,
    'GBP': 0.79,
    'JPY': 150.0,
    'AUD': 1.45,
    'CAD': 1.34,
    'CHF': 0.91,
    'CNY': 7.3,
    'NZD': 1.53,
    'UAE': 24.0,
  };

  String fromCurrency = 'USD';
  String toCurrency = 'INR';

  final TextEditingController amountController = TextEditingController();
  String result = '';
  final List<BoxShadow> commonShadow = [  //box shadow
    BoxShadow(
      color: Colors.white.withOpacity(0.15),
      spreadRadius: 2,
      blurRadius: 5,
      offset: const Offset(0, 3),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final double commonWidth = MediaQuery.of(context).size.width * 0.85;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 147, 191, 236),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
            boxShadow: commonShadow,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 86),
              const Text(
                'CURRENCY CONVERTER',                              //App Title
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 2, 35, 61),
                ),
              ),
              const SizedBox(height: 24),

              SizedBox(                                           //Two options
                width: commonWidth,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Expanded(
                        child: Container(                            //Box from    
                          padding: const EdgeInsets.all(5), 
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            boxShadow: commonShadow,
                          ),

                          child: DropdownButton<String>(  //dropdownbutton
                            value: fromCurrency,               //text & options
                            isExpanded: true,
                            underline: const SizedBox(),
                            items: rates.keys.map((currency) {
                              return DropdownMenuItem(
                                value: currency,
                                child: Text(
                                  "From: $currency",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 2, 35, 61),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                fromCurrency = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      Expanded(                                       //Box To
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: commonShadow,
                          ),

                          child: DropdownButton<String>(       //text & options
                            value: toCurrency,
                            isExpanded: true,
                            underline: const SizedBox(),
                            items: rates.keys.map((currency) {
                              return DropdownMenuItem(
                                value: currency,
                                child: Text(
                                  "To: $currency",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 2, 35, 61),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                toCurrency = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              SizedBox(                                                //Input
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Amount', //hint text
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 2, 35, 61),
                      fontSize: 18,
                    ),
                    filled: true,
                    fillColor: Colors.white,

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
              ),

              Padding(                                        //Convert button
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {  //data has changed, rebuild UI (sstate)

                            double amount = double.tryParse(amountController.text) ?? 0;          //Conversion logic
                            double converted = amount * rates[fromCurrency]! / rates[toCurrency]!;
                            result = "$converted $toCurrency";

                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 2, 35, 61),
                        ),
                        child: const Text(
                          "Convert",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),

                      SizedBox(                                   //Result box
                        width: commonWidth,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          constraints: BoxConstraints(minHeight: 50),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            boxShadow: commonShadow,
                          ),
                          child: Text(                          //Result text
                            result,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 2, 35, 61),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

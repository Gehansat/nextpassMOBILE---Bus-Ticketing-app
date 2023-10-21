import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:intl/intl.dart';
import 'package:nextpass/pages/Successpayment.dart';
import 'package:nextpass/pages/pay.dart';
import 'QrUI.dart';
import 'constants.dart';

class Payment extends StatelessWidget {
  final String? selectedPass;
  final String? passCost;

  Payment(this.selectedPass, this.passCost);

  @override
  Widget build(BuildContext context) {
    return PaymentPage(selectedPass, passCost);
  }
}

class PaymentPage extends StatelessWidget {
  final String? selectedPass;
  final String? passCost;

  PaymentPage(this.selectedPass, this.passCost);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PaymentDetailsCard(selectedPass, passCost),
              SizedBox(height: 20),
              PaymentForm(),
              SizedBox(height: 20),
              
             Row(
                children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => UsePaypal(
                              sandboxMode: true,
                              clientId: "${Constants.clientId}",
                              secretKey: "${Constants.secretKey}",
                              returnURL: "${Constants.returnURL}",
                              cancelURL: "${Constants.cancelURL}",
                              transactions: const [
                                {
                                  "amount": {
                                    "total": '55',
                                    "currency": "USD",
                                    "details": {
                                      "subtotal": '55',
                                                                      }
                                  },
                                  "description":
                                      "The payment transaction description.",
                                  // "payment_options": {
                                  //   "allowed_payment_method":
                                  //       "INSTANT_FUNDING_SOURCE"
                                  // },
                                  "item_list": {
                                    "items": [
                                      {
                                        "name": "A demo product",
                                        "quantity": 1,
                                        "price": '55',
                                        "currency": "USD"
                                      }
                                    ],

                                    // shipping address is not required though
                                    "shipping_address": {
                                      "recipient_name": "Jane Foster",
                                      "line1": "Travis County",
                                      "line2": "",
                                      "city": "Austin",
                                      "country_code": "US",
                                      "postal_code": "73301",
                                      "phone": "+00000000",
                                      "state": "Texas"
                                    },
                                  }
                                }
                              ],
                              note:
                                  "Contact us for any questions on your order.",
                              onSuccess: (Map params) async {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SuccessfulPaymentScreen(),
                                  ),
                                );
                              },
                              onError: (error) {
                                print("onError: $error");
                              },
                              onCancel: (params) {
                                print('cancelled: $params');
                              }),
                        ),
                      );
                    },
                    child: const Text('Pay With PayPal')),
                    const SizedBox(width: 140),
                    ElevatedButton(
                      onPressed: () {
                        // Add action to navigate to another screen or close this message
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => QRScreen()));
                      },
                      child: Text("Continue"),
                    ),
            ],

)

            ],
          ),
        ),
      ),
    );
  }
}

class PaymentDetailsCard extends StatelessWidget {
  final String? selectedPass;
  final String? passCost;

  PaymentDetailsCard(this.selectedPass, this.passCost);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Selected Pass: $selectedPass", style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text("Amount: $passCost", style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text("Tax: \$10.00", style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text(
            "Total: ${_calculateTotalCost(passCost)}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  String _calculateTotalCost(String? passCost) {
    if (passCost != null) {
      try {
        final tax = 10.00;
        // Remove the dollar sign and any non-numeric characters
        final cleanedCost = passCost.replaceAll(RegExp(r'[^0-9.]'), '');
        final amount = double.parse(cleanedCost);
        final total = amount + tax;

        final currencyFormatter = NumberFormat.simpleCurrency(decimalDigits: 2);
        return currencyFormatter.format(total);
      } catch (e) {
        return "Invalid Amount";
      }
    } else {
      return "\$0.00";
    }
  }
}

class PaymentForm extends StatefulWidget {
  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController cvcController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Card Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            buildTextField("Card Number", "Enter card number", cardNumberController, validateCardNumber),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: buildTextField("Expiration Date", "MM/YYYY", expirationDateController, validateExpirationDate),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: buildTextField("CVC", "123", cvcController, validateCVC),
                ),
              ],
            ),
            SizedBox(height: 10),
            buildTextField("Cardholder's Name", "Enter cardholder's name", cardHolderNameController, validateCardHolderName),
            SizedBox(height: 20),
            
            // ElevatedButton(
            //   onPressed: () {
            //     if (_formKey.currentState!.validate()) {
            //       // Form is valid, proceed with payment processing
            //       // Add your payment processing logic here
            //       Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SuccessfulPaymentScreen()));
            //     }
            //   },
            //   child: Text('Process Payment', style: TextStyle(fontSize: 16)),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hint, TextEditingController controller, String? Function(String?)? validator) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validator,
    );
  }

  String? validateCardNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a valid card number';
  }
  // Add your card number validation logic here
  if (value.length < 16) {
    return 'Card number must be 16 digits long';
  }
  return null;
}

String? validateExpirationDate(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a valid expiration date (MM/YYYY)';
  }
  // Add your expiration date validation logic here
  if (value.length != 7) {
    return 'Expiration date must be in MM/YYYY format';
  }
  return null;
}

String? validateCVC(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a valid CVC';
  }
  // Add your CVC validation logic here
  if (value.length != 3) {
    return 'CVC must be 3 digits long';
  }
  return null;
}

String? validateCardHolderName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter the cardholder\'s name';
  }
  // Add your cardholder's name validation logic here
  return null;
}
}
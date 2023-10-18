import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
              GestureDetector(
                onTap: () {
                  // Add payment processing logic here
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Pay",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
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

class PaymentForm extends StatelessWidget {
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
          Text(
            "Card Information",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          buildTextField("Card Number", "Enter card number"),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: buildTextField("Expiration Date", "MM/YYYY"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: buildTextField("CVC", "123"),
              ),
            ],
          ),
          SizedBox(height: 10),
          buildTextField("Cardholder's Name", "Enter cardholder's name"),
        ],
      ),
    );
  }

  Widget buildTextField(String label, String hint) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

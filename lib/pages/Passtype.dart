import 'package:flutter/material.dart';
import 'package:nextpass/pages/Payment.dart';

class TravelPassPage extends StatefulWidget {
  @override
  _TravelPassPageState createState() => _TravelPassPageState();
}

class _TravelPassPageState extends State<TravelPassPage> {
  String? selectedPass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Travel Pass"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SelectablePassCard(
              name: "Travel Buddy Pass",
              cost: "\$20.00",
              days: "Valid for one day",
              isSelected: selectedPass == "Travel Buddy Pass",
              onTap: () {
                setState(() {
                  selectedPass = "Travel Buddy Pass";
                  navigateToPaymentPage(selectedPass, "\$20.00");
                });
              },
            ),
            SizedBox(height: 20),
            SelectablePassCard(
              name: "Travel Lite Pass",
              cost: "\$45.00",
              days: "Valid for three days",
              isSelected: selectedPass == "Travel Lite Pass",
              onTap: () {
                setState(() {
                  selectedPass = "Travel Lite Pass";
                  navigateToPaymentPage(selectedPass, "\$45.00");
                });
              },
            ),
            SizedBox(height: 20),
            SelectablePassCard(
              name: "Travel Max Pass",
              cost: "\$80.00",
              days: "Valid for five days",
              isSelected: selectedPass == "Travel Max Pass",
              onTap: () {
                setState(() {
                  selectedPass = "Travel Max Pass";
                  navigateToPaymentPage(selectedPass, "\$80.00");
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // Function to navigate to the Payment page
  void navigateToPaymentPage(String? selectedPass, String cost) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Payment(selectedPass, cost),
      ),
    );
  }
}

class SelectablePassCard extends StatelessWidget {
  final String name;
  final String cost;
  final String days;
  final bool isSelected;
  final VoidCallback onTap;

  SelectablePassCard({
    required this.name,
    required this.cost,
    required this.days,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: isSelected ? Colors.blue : null, // Highlight the selected card
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : null,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Cost: $cost",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                days,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

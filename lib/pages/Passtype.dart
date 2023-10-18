import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextpass/pages/Detailspage.dart';
import 'package:nextpass/pages/Payment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
                });
              },
            ),          
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedPass != null) {
                  // Save the selected package details to Firestore
                  saveSelectedPackageToFirebase(selectedPass!);
                  print("Success");
                 
                } else {
                  // Handle unselected state or show an error message
                }
              },
              child: Text("Confirm Package"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Payment(),
                  ),
                );
              },
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }

  // Function to save the selected package to Firebase Firestore
  void saveSelectedPackageToFirebase(String selectedPackage) {
    final userPackageCollection = FirebaseFirestore.instance.collection('userPackages');

    // Save the selected package details
    userPackageCollection.add({
      'SelectedPackage': selectedPackage,
      'Cost': getPackageCost(selectedPackage),
      'Days': getPackageDays(selectedPackage),
    });
  }

  // Function to get the cost for a specific package
  String getPackageCost(String package) {
    if (package == "Travel Buddy Pass") {
      return "\$20.00";
    } else if (package == "Travel Lite Pass") {
      return "\$45.00";
    } else if (package == "Travel Max Pass") {
      return "\$80.00";
    }
    return "";
  }

  // Function to get the days for a specific package
  String getPackageDays(String package) {
    if (package == "Travel Buddy Pass") {
      return "Valid for one day";
    } else if (package == "Travel Lite Pass") {
      return "Valid for three days";
    } else if (package == "Travel Max Pass") {
      return "Valid for five days";
    }
    return "";
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

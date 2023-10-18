import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextpass/pages/Detailspage.dart';
import 'package:nextpass/pages/Payment.dart';

class Passtype extends StatelessWidget {
  const Passtype({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Travel Pass Selection",
      home: TravelPassPage(),
    );
  }
}

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
              previousUsers: "120 users",
              note: "Valid for one day",
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
              previousUsers: "280 users",
              note: "Valid for three days",
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
              previousUsers: "450 users",
              note: "Valid for five days",
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Detailspage(),
      ),
    );
  },
  child: Text("Back"),
),
             SizedBox(height: 20),
     ElevatedButton(
  onPressed: () {
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (ctx) => Payment()),
    );
  },
  child: Text("Confirm Package"),
)
          ],
        ),
      ),
    );
  }
}

class SelectablePassCard extends StatelessWidget {
  final String name;
  final String cost;
  final String previousUsers;
  final String note;
  final bool isSelected;
  final VoidCallback onTap;

  SelectablePassCard({
    required this.name,
    required this.cost,
    required this.previousUsers,
    required this.note,
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
                  color: isSelected
                      ? Colors.white
                      : null, // Text color for selected card
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Cost: $cost",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                "Previous Users: $previousUsers",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                note,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nextpass/pages/Passtype.dart';

class UserDetailsPage extends StatefulWidget {
  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController visaNumberController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  DateTime? arrivingDate;
  DateTime? leavingDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: visaNumberController,
              decoration: InputDecoration(labelText: 'Visa Number'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a visa number';
                }
                return null;
              },
            ),
            TextFormField(
              controller: contactNumberController,
              decoration: InputDecoration(labelText: 'Contact Number'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a contact number';
                }
                return null;
              },
            ),
            buildDateInput(
              "Arriving Date",
              arrivingDate,
              (date) {
                setState(() {
                  arrivingDate = date;
                });
              },
            ),
            buildDateInput(
              "Leaving Date",
              leavingDate,
              (date) {
                setState(() {
                  leavingDate = date;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await addUserDetailsToFirebase();
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (ctx) => TravelPassPage()),);
                }
              },
              child: Text('Save User Details'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addUserDetailsToFirebase() async {
    final userDetailsCollection = FirebaseFirestore.instance.collection('userDetails');
    final userDetails = UserDetails(
      name: nameController.text,
      email: emailController.text,
      visaNumber: visaNumberController.text,
      contactNumber: contactNumberController.text,
      arrivingDate: arrivingDate,
      leavingDate: leavingDate,
    );

    // Save user details to Firestore
    final userDocRef = await userDetailsCollection.add(userDetails.toMap());

    // Show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('User details saved successfully'),
      ),
    );
  }

  Widget buildDateInput(String label, DateTime? date, Function(DateTime) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2101),
            ).then((pickedDate) {
              if (pickedDate != null) {
                onChanged(pickedDate);
              }
            });
          },
          child: InputDecorator(
            decoration: InputDecoration(
              hintText: 'Select Date',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  date != null
                      ? "${date.toLocal()}".split(' ')[0]
                      : 'Select Date',
                  style: TextStyle(fontSize: 16),
                ),
                Icon(Icons.calendar_today),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class UserDetails {
  final String name;
  final String email;
  final String visaNumber;
  final String contactNumber;
  final DateTime? arrivingDate;
  final DateTime? leavingDate;

  UserDetails({
    required this.name,
    required this.email,
    required this.visaNumber,
    required this.contactNumber,
    this.arrivingDate,
    this.leavingDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'visaNumber': visaNumber,
      'contactNumber': contactNumber,
      'arrivingDate': arrivingDate?.toUtc(),
      'leavingDate': leavingDate?.toUtc(),
    };
  }
}

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
            buildTextFormField(
              label: 'Name',
              controller: nameController,
              hint: 'Name',
            ),
            SizedBox(height: 10),
            buildTextFormField(
              label: 'Email',
              controller: emailController,
              hint: 'Email',
            ),
            SizedBox(height: 10),
            buildTextFormField(
              label: 'Visa Number',
              controller: visaNumberController,
              hint: 'Visa Number',
            ),
            SizedBox(height: 10),
            buildTextFormField(
              label: 'Contact Number',
              controller: contactNumberController,
              hint: 'Contact Number',
            ),
            buildDateInput(
              hintText: 'Arriving Date',
              date: arrivingDate,
              onChanged: (date) {
                setState(() {
                  arrivingDate = date;
                });
              },
            ),
            buildDateInput(
              hintText: 'Leaving Date',
              date: leavingDate,
              onChanged: (date) {
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
                    MaterialPageRoute(builder: (ctx) => TravelPassPage()),
                  );
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
    await userDetailsCollection.add(userDetails.toMap());

    // Show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('User details saved successfully'),
      ),
    );
  }

  Widget buildDateInput({
    required String hintText,
    DateTime? date,
    required Function(DateTime) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              hintText: hintText,
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
                      : hintText,
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

  Widget buildTextFormField({
    required String label,
    required TextEditingController controller,
    required String hint,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hint';
        }
        return null;
      },
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

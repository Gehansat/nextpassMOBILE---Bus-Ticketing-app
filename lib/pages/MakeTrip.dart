import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MakeTrip extends StatefulWidget {
  const MakeTrip({Key? key}) : super(key: key);

  @override
  _MakeTripState createState() => _MakeTripState();
}

class _MakeTripState extends State<MakeTrip> {
  String? selectedStartingPoint = 'Starting Point';
  String? selectedEndingPoint = 'Ending Point';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              "Start Your Journey!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 270,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Color(0xffD4E0FF),
                  width: 2.0,
                ),
              ),

              // Retrieve data from Firestore ==============================
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('busholts').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text("No data available.");
                  }

                  final busholts = snapshot.data!.docs;
                  List<String> holtNames = ['Starting Point', 'Ending Point'];

                  for (var busholt in busholts) {
                    var holtName = busholt['HoltName'] as String;
                    holtNames.add(holtName);
                  }

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // ======= first dropdown ==============================
                    children: [
                      DropdownButton<String>(
                        value: selectedStartingPoint,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedStartingPoint = newValue;
                          });
                        },
                        items: holtNames.map((String holtName) {
                          return DropdownMenuItem<String>(
                            value: holtName,
                            child: Text(holtName),
                          );
                        }).toList(),
                      ),

                      // ======= second dropdown =============================
                      DropdownButton<String>(
                        value: selectedEndingPoint,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedEndingPoint = newValue;
                          });
                        },
                        items: holtNames.map((String holtName) {
                          return DropdownMenuItem<String>(
                            value: holtName,
                            child: Text(holtName),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff0048FF),
                onPrimary: Colors.white,
                fixedSize: const Size(245, 60),
                textStyle: const TextStyle(
                    fontSize: 20
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Adjust the radius value as needed
                ),
              ),
              onPressed: () {},
              child: const Text('Calculate Fee'),
            ),
            const SizedBox(height: 20),
            Text("Your Fee is: ")
          ],
        ),
      ),
    );
  }
}

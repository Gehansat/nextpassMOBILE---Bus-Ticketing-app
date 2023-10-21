// import 'package:flutter/material.dart';
// import 'package:flutter_paypal/flutter_paypal.dart';
// import 'package:nextpass/pages/Successpayment.dart';

// import 'constants.dart';

// class PaymentUI extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Temporary Travel Pass')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Row(
//               children: List.generate(5, (index) {
//                 return Expanded(
//                   child: Container(
//                     height: 20,
//                     color: index == 4 ? Colors.blue : Colors.grey[300],
//                   ),
//                 );
//               }),
//             ),
//             const SizedBox(height: 40),
            
//             const SizedBox(height: 20),
                        
//             const Spacer(),
//             Column(
//               children: <Widget>[
//                 ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (BuildContext context) => UsePaypal(
//                               sandboxMode: true,
//                               clientId: "${Constants.clientId}",
//                               secretKey: "${Constants.secretKey}",
//                               returnURL: "${Constants.returnURL}",
//                               cancelURL: "${Constants.cancelURL}",
//                               transactions: const [
//                                 {
//                                   "amount": {
//                                     "total": '55',
//                                     "currency": "USD",
//                                     "details": {
//                                       "subtotal": '55',
//                                                                       }
//                                   },
//                                   "description":
//                                       "The payment transaction description.",
//                                   // "payment_options": {
//                                   //   "allowed_payment_method":
//                                   //       "INSTANT_FUNDING_SOURCE"
//                                   // },
//                                   "item_list": {
//                                     "items": [
//                                       {
//                                         "name": "A demo product",
//                                         "quantity": 1,
//                                         "price": '55',
//                                         "currency": "USD"
//                                       }
//                                     ],

//                                     // shipping address is not required though
//                                     "shipping_address": {
//                                       "recipient_name": "Jane Foster",
//                                       "line1": "Travis County",
//                                       "line2": "",
//                                       "city": "Austin",
//                                       "country_code": "US",
//                                       "postal_code": "73301",
//                                       "phone": "+00000000",
//                                       "state": "Texas"
//                                     },
//                                   }
//                                 }
//                               ],
//                               note:
//                                   "Contact us for any questions on your order.",
//                               onSuccess: (Map params) async {
//                                 Navigator.of(context).push(
//                                   MaterialPageRoute(
//                                     builder: (BuildContext context) =>
//                                         SuccessfulPaymentScreen(),
//                                   ),
//                                 );
//                               },
//                               onError: (error) {
//                                 print("onError: $error");
//                               },
//                               onCancel: (params) {
//                                 print('cancelled: $params');
//                               }),
//                         ),
//                       );
//                     },
//                     child: const Text('Pay With PayPal'))
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter_paypal/flutter_paypal.dart';
// // import 'package:nextpass/pages/constants.dart';

// // class PaymentUI extends StatelessWidget {
// //   final TextEditingController cardHolderNameController = TextEditingController();
// //   final TextEditingController cardNumberController = TextEditingController();
// //   final String documentId = 'PBACeSorZpZmiWiXIDmE'; // Replace with the document ID

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Temporary Travel Pass')),
// //       body: Padding(
// //         padding: EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             Row(
// //               children: List.generate(5, (index) {
// //                 return Expanded(
// //                   child: Container(
// //                     height: 20,
// //                     color: index == 4 ? Colors.blue : Colors.grey[300],
// //                   ),
// //                 );
// //               }),
// //             ),
// //             const SizedBox(height: 40),
// //             const Text('Payment'),
// //             const SizedBox(height: 20),
// //             TextField(
// //               controller: cardHolderNameController,
// //               decoration: InputDecoration(
// //                 labelText: 'Name on card',
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             TextField(
// //               controller: cardNumberController,
// //               decoration: InputDecoration(
// //                 labelText: 'Card number',
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             Row(
// //               children: [
// //                 Expanded(
// //                   child: TextField(
// //                     decoration: InputDecoration(
// //                       labelText: 'Exp. Date',
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(width: 20),
// //                 Expanded(
// //                   child: TextField(
// //                     obscureText: true,
// //                     decoration: InputDecoration(
// //                       labelText: 'CVV',
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             Spacer(),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 OutlinedButton(onPressed: () {}, child: const Text('BACK')),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     fetchDataAndPayWithPayPal(context);
// //                   },
// //                   child: const Text('PAY NOW'),
// //                 )
// //               ],
// //             ),
// //             Spacer(),
// //             Column(
// //               children: <Widget>[
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     fetchDataAndPayWithPayPal(context);
// //                   },
// //                   child: const Text('Pay With PayPal'),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Future<void> fetchDataAndPayWithPayPal(BuildContext context) async {
// //     await Firebase.initializeApp(); // Initialize Firebase

// //     fetchDataFromFirestore(documentId).then((data) {
// //       final name = data['name'];
// //       final cost = data['cost'];
// //       final days = data['days'];
// //       final cardHolderName = cardHolderNameController.text;
// //       final cardNumber = cardNumberController.text;

// //       // Set up your PayPal transaction details using the retrieved data
// //       final transaction = [
// //         {
// //           "amount": {
// //             "total": cost,
// //             "currency": "USD",
// //             "details": {
// //               "subtotal": cost,
// //               "shipping": '0',
// //               "shipping_discount": 0,
// //             },
// //           },
// //           "description": "Temporary Travel Pass for $name",
// //           "item_list": {
// //             "items": [
// //               {
// //                 "name": name,
// //                 "quantity": 1,
// //                 "price": cost,
// //                 "currency": "USD",
// //               }
// //             ],
// //           },
// //         }
// //       ];

// //       Navigator.of(context).push(MaterialPageRoute(
// //         builder: (BuildContext context) => UsePaypal(
// //           sandboxMode: true,
// //             clientId: "${Constants.clientId}",
// //             secretKey: "${Constants.secretKey}",
// //             returnURL: "${Constants.returnURL}",
// //             cancelURL: "${Constants.cancelURL}",
// //           transactions: transaction,
// //           onSuccess: (Map params) {
// //             // Handle the PayPal success callback
// //             // This is where you can navigate to a success page
// //           },
// //           onError: (error) {
// //             print("PayPal onError: $error");
// //           },
// //           onCancel: (params) {
// //             print("PayPal canceled: $params");
// //           },
// //         ),
// //       ));
// //     });
// //   }

// //   Future<Map<String, dynamic>> fetchDataFromFirestore(String documentId) async {
// //     try {
// //       DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
// //           .collection('userPackages') // Replace with your Firestore collection name
// //           .doc(documentId)
// //           .get();

// //       if (documentSnapshot.exists) {
// //         return documentSnapshot.data() as Map<String, dynamic>;
// //       } else {
// //         return {}; // Document does not exist
// //       }
// //     } catch (e) {
// //       print('Error fetching data: $e');
// //       return {}; // Handle the error as needed
// //     }
// //   }
// // }

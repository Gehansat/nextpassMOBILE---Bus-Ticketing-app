// import 'package:example_csse/paymentSucessful.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_paypal/flutter_paypal.dart';

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
//             const Text('Payment'),
//             const SizedBox(height: 20),
//             const TextField(
//               decoration: InputDecoration(
//                 labelText: 'Name on card',
//               ),
//             ),
//             const SizedBox(height: 20),
//             const TextField(
//               decoration: InputDecoration(
//                 labelText: 'Card number',
//               ),
//             ),
//             SizedBox(height: 20),
//             const Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       labelText: 'Exp. Date',
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 20),
//                 Expanded(
//                   child: TextField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       labelText: 'CVV',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 OutlinedButton(onPressed: () {}, child: const Text('BACK')),
//                 ElevatedButton(
//                     onPressed: () {
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //     builder: (context) => const PaymentSuccessfulUI(),
//                       //   ),
//                       // );
//                     },
//                     child: const Text('PAY NOW'))
//               ],
//             ),
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
//                                     "total": '10.12',
//                                     "currency": "USD",
//                                     "details": {
//                                       "subtotal": '10.12',
//                                       "shipping": '0',
//                                       "shipping_discount": 0
//                                     }
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
//                                         "price": '10.12',
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
//                                         PaymentSuccessfulUI(),
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
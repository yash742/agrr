import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:http/http.dart' as http;

class Payee extends StatefulWidget {
  @override
  _PayeeState createState() => _PayeeState();
}

class _PayeeState extends State<Payee> {
  double costPrice = 10.0;
  int amount = 0;
  String url;
  @override
  void initState() {
    super.initState();
    StripePayment.setOptions(StripeOptions(publishableKey: ""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
          onPressed: () {
            startPayment();
          },
          child: Text("PAY")),
    );
  }

  Future<void> startPayment() async {
    StripePayment.setStripeAccount(null);
    amount = (10 * 100).toInt();
    PaymentMethod paymentMethod = PaymentMethod();
    paymentMethod =
        await StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest())
            .then((PaymentMethod paymentMethod) {
      return paymentMethod;
    }).catchError((e) {
      print(e);
    });
    startDirectCharge(paymentMethod);
  }

  Future<void> startDirectCharge(PaymentMethod paymentMethod) async {
    final http.Response response = await http.post(
        Uri.parse("$url?amount=$amount&currency=USD&paym=${paymentMethod.id}"));
    if (response.body != null) {
      final paymentIntent = jsonDecode(response.body);
      final status = paymentIntent["paymentIntent"]["status"];
      final acct = paymentIntent["stripeAccount"];

      if (status == "succeeded") {
        print("payment don");
      } else {
        StripePayment.setStripeAccount(acct);
        await StripePayment.confirmPaymentIntent(PaymentIntent(
                paymentMethodId: paymentIntent["paymentIntent"]
                    ["payment_method"],
                clientSecret: paymentIntent["paymentIntent"]["client_secret"]))
            .then((PaymentIntentResult paymentIntentResult) async {
          final paymentStatus = paymentIntentResult.status;
          if (paymentStatus == "succeeded") {
            print("payment Done");
          }
        });
      }
    }
  }
}

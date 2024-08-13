import 'package:event_app/app/presentation/payment_method/model/payment_method_model.dart';
import 'package:flutter/material.dart';

class PaymentMethodProvider extends ChangeNotifier {

  List<PaymentMethodModel> paymentList = [
    PaymentMethodModel(name: "Credit Card",image: "assets/images/Groupone.svg"),
    PaymentMethodModel(name: "Paypall",image: "assets/images/Grouptwo.svg"),
    PaymentMethodModel(name: "Apple Pay",image: "assets/images/Groupapple.svg"),
  ];
}
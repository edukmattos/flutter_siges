import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_siges/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {

  runApp(ModularApp(module: AppModule()));

  await Firestore.instance.collection("clients")
    .document("004")
      .setData(
        {
          "name": "ACMTek",
          "email": "acmtek@gmail.com"
        }
      );
}
  
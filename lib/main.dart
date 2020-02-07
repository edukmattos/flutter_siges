import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/material.dart';
import 'package:flutter_siges/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {

  runApp(ModularApp(module: AppModule()));

  await Firestore.instance.collection("clients")
    .document()
      .setData(
        {
          "name": "ACMTek",
          "email": "acmtek@gmail.com"
        }
      );
}
  
import 'package:exam/detailPage.dart';
import 'package:exam/homePage.dart';
import 'package:flutter/material.dart';

import 'modalClass.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
        'detail': (context) => Detail(),
      },
    ),
  );
}

class Global {
  static List<ModalClass> alldata = [];
}
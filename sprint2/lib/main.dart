import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sprint2/request.dart';
import 'package:sprint2/signup2.dart';
import 'demand.dart';
import 'login.dart';
import 'navigation.dart';
import 'signup.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'navigation',
        routes: {
          'login': (context) => const MyLogin(),
          'register': (context) => const MyRegister(),
          'files': (context) => PdfUploaderApp(),
          'demand': (context) => Tasks(),
          'request': (context) => HomeCareRequestForm(),
          'navigation': (context) => firstPage(),
        }),
  );
}

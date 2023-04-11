import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sprint2/signup2.dart';
import 'login.dart';
import 'signup.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'files',
        routes: {
          'login': (context) => const MyLogin(),
          'register': (context) => const MyRegister(),
          'files': (context) => PdfUploaderApp(),
        }),
  );
}

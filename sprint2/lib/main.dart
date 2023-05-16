import 'package:flutter/material.dart';
import 'package:sprint2/newprofile.dart';
import 'package:sprint2/request.dart';
import 'package:sprint2/signup2.dart';
import 'demand.dart';
import 'login.dart';
import 'navigation.dart';
import 'signup.dart';
import 'profile.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'newprofile',
        routes: {
          'login': (context) => const MyLogin(),
          'register': (context) => const MyRegister(),
          'files': (context) => PdfUploaderApp(),
          'demand': (context) => Tasks(),
          'request': (context) => HomeCareRequestForm(),
          'navigation': (context) => firstPage(),
          'profile': (context) => ProfilePage(),
          'newprofile': (context) => profilePage2(),
        }),
  );
}

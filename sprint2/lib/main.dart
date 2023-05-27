import 'package:flutter/material.dart';
import 'package:sprint2/newprofile.dart';
import 'package:sprint2/raport.dart';
import 'package:sprint2/request.dart';
import 'package:sprint2/signup2.dart';
import 'demand.dart';
import 'hahaha.dart';
import 'home.dart';
import 'homedoctor.dart';
import 'login.dart';
import 'medicalrecords.dart';
import 'navigation.dart';
import 'signup.dart';
import 'profile.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'teampage.dart';

void main() async {
  await dotenv.load();
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'newprofile',
        routes: {
          'login': (context) => const MyLogin(),
          'report': (context) => PatientReportForm(),
          'register': (context) => const MyRegister(),
          'files': (context) => PdfUploaderApp(),
          'demand': (context) => const Tasks(),
          'request': (context) => HomeCareRequestForm(),
          'navigation': (context) => firstPage(),
          'doctorHome': (context) => const doctorhome(),
          'newprofile': (context) => const profilePage2(),
          'medicalrecords': (context) => PdfFilesScreen(),
          'raportList': (context) => const raportList(),
          'doctorList': (context) => DoctorListApp(),
        }),
  );
}

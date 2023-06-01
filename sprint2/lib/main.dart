import 'package:flutter/material.dart';
import 'package:sprint2/newprofile.dart';

import 'package:sprint2/request.dart';
import 'package:sprint2/signup2.dart';
import 'appointment.patient.dart';
import 'repo';
import 'hahaha.dart';
import 'home.dart';
import 'homedoctor.dart';
import 'login.dart';
import 'medicalrecords.dart';
import 'navigation.dart';
import 'signup.dart';
import 'profile.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'teampage.doctor.dart';

void main() async {
  await dotenv.load();
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'doctorList',
        routes: {
          'login': (context) => const MyLogin(),
          'report': (context) => PatientReportForm(),
          'register': (context) => const MyRegister(),
          'files': (context) => PdfUploaderApp(),
          'demand': (context) => Tasks(),
          'request': (context) => HomeCareRequestForm(),
          'navigation': (context) => firstPage(),
          'doctorHome': (context) => doctorhome(),
          'newprofile': (context) => profilePage2(),
          'medicalrecords': (context) => PdfFilesScreen(),
          'raportList': (context) => raportList(),
          'doctorList': (context) => DoctorListApp(),
        }),
  );
}

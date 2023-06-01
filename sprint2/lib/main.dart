import 'package:flutter/material.dart';
import 'package:sprint2/profile.patient.dart';

import 'package:sprint2/appointmentrequestDr.patient.dart';
import 'package:sprint2/signup2.dart';
import 'appointment.patient.dart';
import 'reportForm.doctor.dart';
import 'report.patient.dart';
import 'home.patient.dart';
import 'home.doctor.dart';
import 'login.dart';
import 'medicalrecords.dart';
import 'navigation.dart';
import 'signup.dart';
import 'profile.patient.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'teampage.doctor.dart';

void main() async {
  await dotenv.load();
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'raportListPatient',
        routes: {
          'login': (context) => const MyLogin(),
          'report': (context) => PatientReportForm(),
          'register': (context) => const MyRegister(),
          'files': (context) => PdfUploaderApp(),
          'demand': (context) => Tasks(),
          'request': (context) => HomeCareRequestFormDr(),
          'navigation': (context) => firstPage(),
          'doctorHome': (context) => doctorhome(),
          'newprofile': (context) => profilePage2(),
          'medicalrecords': (context) => PdfFilesScreen(),
          'raportListPatient': (context) => raportListPatient(),
          'doctorList': (context) => DoctorListApp(),
        }),
  );
}

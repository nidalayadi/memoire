import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PatientReportForm extends StatefulWidget {
  @override
  _PatientReportFormState createState() => _PatientReportFormState();
}

class _PatientReportFormState extends State<PatientReportForm> {
  Future<http.Response> writeRaport(
    String patientName,
    String patientAge,
    String patientSymptoms,
    String patientCauses,
    String patientDiagnosis,
    String patientTreatment,
    File image,
  ) async {
    final bytes = await image.readAsBytes();
    final base64Image = base64Encode(bytes);

    final response = await http.post(
      Uri.parse('http://example.com/create-report'),
      body: {
        'patientName': patientName,
        'patientAge': patientAge,
        'patientSymptoms': patientSymptoms,
        'patientCauses': patientCauses,
        'patientDiagnosis': patientDiagnosis,
        'patientTreatment': patientTreatment,
        'image': base64Image,
      },
    );

    return response;
  }

  final ImagePicker _picker = ImagePicker();
  File? imagelink;
  TextEditingController patientNameController = TextEditingController();
  TextEditingController patientAgeController = TextEditingController();
  TextEditingController patientSymptomsController = TextEditingController();
  TextEditingController patientCausesController = TextEditingController();
  TextEditingController patientDiagnosisController = TextEditingController();
  TextEditingController patientTreatmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Report Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 16.0),
            Text(
              'Patient Information',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: patientNameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: patientAgeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: patientSymptomsController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Symptoms',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),
            Text(
              'Medical Information',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: patientCausesController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Related Causes from Medical Record',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: patientDiagnosisController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Diagnosis',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: patientTreatmentController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Treatment Plans',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () async {
                final XFile? image =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  imagelink = File(image.path);
                }
              },
              child: Text(
                'Attach a Prescription',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                writeRaport(
                    patientNameController.text,
                    patientAgeController.text,
                    patientSymptomsController.text,
                    patientCausesController.text,
                    patientDiagnosisController.text,
                    patientTreatmentController.text,
                    imagelink!);
              },
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeCareRequest {
  final String date;
  final String time;
  final String doctorSpeciality;
  final String location;
  final String patientName;

  HomeCareRequest(
      {required this.date,
      required this.time,
      required this.doctorSpeciality,
      required this.location,
      required this.patientName});
}

class HomeCareRequestForm extends StatefulWidget {
  @override
  _HomeCareRequestFormState createState() => _HomeCareRequestFormState();
}

class _HomeCareRequestFormState extends State<HomeCareRequestForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _doctorSpecialityController =
      TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _patientNameController = TextEditingController();
  String _resultMessage = '';

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Create home care request object
      HomeCareRequest homeCareRequest = HomeCareRequest(
        date: _dateController.text,
        time: _timeController.text,
        doctorSpeciality: _doctorSpecialityController.text,
        location: _locationController.text,
        patientName: _patientNameController.text,
      );

      // Send home care request to API
      var response = await http.post(
        Uri.parse('https://api.example.com/homecare'),
        body: homeCareRequest.toString(),
      );

      if (response.statusCode == 200) {
        setState(() {
          _resultMessage = 'Home care request submitted successfully!';
        });
      } else {
        setState(() {
          _resultMessage = 'Failed to submit home care request.';
        });
      }
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    _doctorSpecialityController.dispose();
    _locationController.dispose();
    _patientNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Care Request Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _dateController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Date',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a date';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _timeController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Time',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a time';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _doctorSpecialityController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Doctor Speciality',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a doctor speciality';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _locationController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a location';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _patientNameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Patient Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the patient name';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12), // Adjust padding
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 20), // Adjust font size
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onPrimary: Colors.white,
                side: BorderSide(width: 1, color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

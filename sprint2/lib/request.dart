// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeCareRequest {
  final String date;
  final String time;
  final String doctorSpeciality;
  final String location;
  final String patientName;
  final String gender;

  HomeCareRequest({
    required this.date,
    required this.time,
    required this.doctorSpeciality,
    required this.location,
    required this.patientName,
    required this.gender,
  });
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
  String? _genderValue;
  String _resultMessage = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) _dateController.text = picked.toString();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) _timeController.text = picked.format(context);
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      HomeCareRequest homeCareRequest = HomeCareRequest(
        date: _dateController.text,
        time: _timeController.text,
        doctorSpeciality: _doctorSpecialityController.text,
        location: _locationController.text,
        patientName: _patientNameController.text,
        gender: _genderValue!,
      );

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      // Wrap with Flexible to fix overflow error
                      child: GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextFormField(
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
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Flexible(
                      // Wrap with Flexible to fix overflow error
                      child: GestureDetector(
                        onTap: () => _selectTime(context),
                        child: AbsorbPointer(
                          child: TextFormField(
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
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  value: _doctorSpecialityController.text.isEmpty
                      ? null
                      : _doctorSpecialityController.text,
                  onChanged: (value) {
                    setState(() {
                      _doctorSpecialityController.text = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Doctor Speciality',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a doctor speciality';
                    }
                    return null;
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'Primary Care',
                      child: Text('Primary Care'),
                    ),
                    DropdownMenuItem(
                      value: 'Nursing Care',
                      child: Text('Nursing Care'),
                    ),
                    DropdownMenuItem(
                      value: 'Physical Therapy',
                      child: Text('Physical Therapy'),
                    ),
                    DropdownMenuItem(
                      value: 'Occupational Therapy',
                      child: Text('Occupational Therapy'),
                    ),
                    DropdownMenuItem(
                      value: 'Speech Therapy',
                      child: Text('Speech Therapy'),
                    ),
                    DropdownMenuItem(
                      value: 'Respiratory Therapy',
                      child: Text('Respiratory Therapy'),
                    ),
                    DropdownMenuItem(
                      value: 'Nutritional Counseling',
                      child: Text('Nutritional Counseling'),
                    ),
                    DropdownMenuItem(
                      value: 'Elderly Care',
                      child: Text('Elderly Care'),
                    ),
                    DropdownMenuItem(
                      value: 'Palliative Care',
                      child: Text('Palliative Care'),
                    ),
                    DropdownMenuItem(
                      value: 'Rehabilitation',
                      child: Text('Rehabilitation'),
                    ),
                    DropdownMenuItem(
                      value: 'Mental Health',
                      child: Text('Mental Health'),
                    ),
                    DropdownMenuItem(
                      value: 'Infectious Diseases',
                      child: Text('Infectious Diseases'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 20),
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
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _genderValue,
                  onChanged: (value) {
                    setState(() {
                      _genderValue = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a gender';
                    }
                    return null;
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'Male',
                      child: Text('Male'),
                    ),
                    DropdownMenuItem(
                      value: 'Female',
                      child: Text('Female'),
                    ),
                    DropdownMenuItem(
                      value: 'Others',
                      child: Text('Others'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(27, 107, 164, 1),
                    onPrimary: Colors.white,
                    side: BorderSide(width: 1, color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sprint2/appointmentrequestDr.patient.dart';
import 'package:sprint2/functions.dart';

import 'appointmentrequestNr.patient.dart';

class DoctorVisit {
  String doctorName;
  String doctorSpecialty;
  String patientName;
  DateTime time;
  String status;
  String location;

  DoctorVisit({
    required this.doctorName,
    required this.doctorSpecialty,
    required this.patientName,
    required this.time,
    required this.status,
    required this.location,
  });
}

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  DateTime _selectedDay = DateTime.now();

  List<DoctorVisit> _doctorVisits = [];

  void _onDaySelected(DateTime day) {
    setState(() {
      _selectedDay = day;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadDoctorVisits();
  }

  void _loadDoctorVisits() async {
    DateTime currentDate = DateTime.now();
    String visits = await getPatientApoints();
    dynamic visitsList = json.decode(visits)['visit'];
    print("in demand " + visits);
    for (var i = 0; i < visitsList.length; i++) {
      _doctorVisits.add(DoctorVisit(
        doctorName:
            "Dr. ${visitsList[i]['caregiverId']['lastName']} ${visitsList[i]['caregiverId']['firstName']}",
        doctorSpecialty: visitsList[i]['caregiverId']['Specialties'],
        patientName: "",
        time: DateTime(
          DateTime.parse(visitsList[i]['date']).year,
          DateTime.parse(visitsList[i]['date']).month,
          DateTime.parse(visitsList[i]['date']).day,
          DateTime.parse(visitsList[i]['date']).hour,
          DateTime.parse(visitsList[i]['date']).minute,
        ),
        status: visitsList[i]['state'],
        location: visitsList[i]['location'],
      ));
    }
  }

  List<List<DoctorVisit>> _groupVisitsByHour() {
    Map<int, List<DoctorVisit>> groupedVisits = {};
    for (DoctorVisit visit in _doctorVisits) {
      int hour = visit.time.hour;
      if (groupedVisits.containsKey(hour)) {
        groupedVisits[hour]!.add(visit);
      } else {
        groupedVisits[hour] = [visit];
      }
    }
    return groupedVisits.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 32,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          title: const Text(
            'List of Doctor Visits',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
          ),
          backgroundColor: Color.fromRGBO(250, 250, 250, 1.0),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Color.fromRGBO(27, 107, 164, 1),
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      setState(() {
                        _onDaySelected(date);
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 24,
                itemBuilder: (context, hourIndex) {
                  List<DoctorVisit> visits =
                      _groupVisitsByHour().expand((visits) => visits).toList();

                  List<DoctorVisit> hourVisits = visits
                      .where((visit) => visit.time.hour == hourIndex)
                      .toList();

                  return hourVisits.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${hourIndex.toString().padLeft(2, '0')}:00',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: hourVisits.length,
                              separatorBuilder: (context, index) => Divider(),
                              itemBuilder: (context, index) {
                                DoctorVisit visit = hourVisits[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 8.0,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(27, 107, 164, 1),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: ExpansionTile(
                                      title: Row(children: [
                                        Container(
                                          width: 80,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Color.fromARGB(
                                                75, 230, 239, 247),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${visit.time.day}",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                DateFormat.E()
                                                    .format(visit.time)
                                                    .substring(0, 3),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              visit.doctorName,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              'Specialty: ${visit.doctorSpecialty}',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              'Address : ${visit.location}',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              '- ${visit.status}',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      98, 160, 205, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Center(
                                                  child: IconButton(
                                                    icon: Icon(
                                                      Icons.person,
                                                      size: 32,
                                                      color: Colors.white,
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      98, 160, 205, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Center(
                                                  child: IconButton(
                                                    icon: Icon(
                                                      Icons.cancel_outlined,
                                                      size: 32,
                                                      color: Colors.white,
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        )
                      : SizedBox();
                },
              ),
            ),
          ],
        ),
        floatingActionButton: SpeedDial(
          icon: Icons.add,
          backgroundColor: Color.fromRGBO(27, 107, 164, 1),
          childMargin: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          children: [
            SpeedDialChild(
              child: Icon(Icons.local_hospital),
              label: 'Doctor',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeCareRequestFormDr(),
                  ),
                );
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.medical_services),
              label: 'Nurse',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeCareRequestFormNr(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

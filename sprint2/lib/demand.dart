import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

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

  void _loadDoctorVisits() {
    DateTime currentDate = DateTime.now();
    _doctorVisits = [
      DoctorVisit(
        doctorName: 'John Doe',
        doctorSpecialty: 'Cardiologist',
        patientName: 'Alice Smith',
        time: DateTime(
            currentDate.year, currentDate.month, currentDate.day, 10, 0),
        status: 'Pending',
        location: '123 Main St',
      ),
      DoctorVisit(
        doctorName: 'Jane Smith',
        doctorSpecialty: 'Dermatologist',
        patientName: 'Bob Johnson',
        time: DateTime(
            currentDate.year, currentDate.month, currentDate.day, 13, 30),
        status: 'Done',
        location: '456 Elm St',
      ),
      DoctorVisit(
        doctorName: 'Bob Johnson',
        doctorSpecialty: 'Pediatrician',
        patientName: 'Charlie Brown',
        time: DateTime(
            currentDate.year, currentDate.month, currentDate.day, 9, 0),
        status: 'Abort',
        location: '789 Oak St',
      ),
    ];
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
          title: const Text('List of Doctor Visits'),
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
                itemCount: 24, // Use the fixed number of hours in a day
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
                                      vertical: 8.0), // Add vertical padding
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(27, 107, 164,
                                          1), // Replace with your desired background color
                                      borderRadius: BorderRadius.circular(
                                          8.0), // Replace with your desired border radius
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        visit.doctorName,
                                        style: TextStyle(
                                            color: Colors
                                                .white), // Set text color to white
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Patient: ${visit.patientName}',
                                            style: TextStyle(
                                                color: Colors
                                                    .white), // Set text color to white
                                          ),
                                          Text(
                                            'Specialty: ${visit.doctorSpecialty}',
                                            style: TextStyle(
                                                color: Colors
                                                    .white), // Set text color to white
                                          ),
                                          Text(
                                            '${visit.time.hour}:${visit.time.minute} - ${visit.status} - ${visit.location}',
                                            style: TextStyle(
                                                color: Colors
                                                    .white), // Set text color to white
                                          ),
                                        ],
                                      ),
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
      ),
    );
  }
}

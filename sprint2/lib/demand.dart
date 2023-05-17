// ignore_for_file: prefer_final_fields, prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class DoctorVisit {
  String doctorName;
  String doctorSpecialty; // Added field for doctor specialty
  String patientName; // Added field for patient name
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
  const Tasks({Key? key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  List<DoctorVisit> _doctorVisits = [
    DoctorVisit(
      doctorName: 'John Doe',
      doctorSpecialty: 'Cardiologist',
      patientName: 'Alice Smith',
      time: DateTime(2023, 5, 16, 10, 0),
      status: 'Pending',
      location: '123 Main St',
    ),
    DoctorVisit(
      doctorName: 'Jane Smith',
      doctorSpecialty: 'Dermatologist',
      patientName: 'Bob Johnson',
      time: DateTime(2023, 5, 16, 10, 0),
      status: 'Done',
      location: '456 Elm St',
    ),
    DoctorVisit(
      doctorName: 'Bob Johnson',
      doctorSpecialty: 'Pediatrician',
      patientName: 'Charlie Brown',
      time: DateTime(2023, 5, 16, 10, 0),
      status: 'Abort',
      location: '789 Oak St',
    ),
  ];

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      _selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List of Trips'),
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            TableCalendar(
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: true,
              ),
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              focusedDay: _selectedDay,
              selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 10, 16),
              onDaySelected: _onDaySelected,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _doctorVisits.length,
                itemBuilder: (context, index) {
                  DoctorVisit visit = _doctorVisits[index];
                  if (!isSameDay(visit.time, _selectedDay)) {
                    return SizedBox.shrink();
                  }
                  Icon myicon;
                  switch (visit.status) {
                    case "Done":
                      myicon = Icon(
                        Icons.check_circle_outline,
                        color: Colors.green[400],
                        size: 45,
                      );
                      break;
                    case "Abort":
                      myicon = Icon(
                        Icons.cancel_outlined,
                        color: Color.fromARGB(255, 226, 19, 19),
                        size: 45,
                      );
                      break;
                    case "Reschedule":
                      myicon = Icon(
                        Icons.published_with_changes_rounded,
                        color: Colors.green[400],
                        size: 45,
                      );
                      break;
                    default:
                      myicon = Icon(
                        Icons.pending,
                        color: Color.fromARGB(255, 120, 120, 120),
                        size: 45,
                      );
                  }
                  final f = new DateFormat('hh:mm');
                  return Card(
                    child: ListTile(
                      leading: myicon,
                      title: Row(
                        children: [
                          Icon(Icons.calendar_today, size: 14),
                          Text(
                              "${f.format(visit.time)} - ${f.format(DateTime(visit.time.hour + 2))}"),
                        ],
                      ),
                      subtitle: Text('Specialty: ${visit.doctorSpecialty}'),
                      isThreeLine: true,
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        size: 38,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

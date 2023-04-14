import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
  CalendarFormat _calendarFormat = CalendarFormat.month;
  List<DoctorVisit> _doctorVisits = [
    DoctorVisit(
      doctorName: 'John Doe',
      doctorSpecialty: 'Cardiologist',
      patientName: 'Alice Smith',
      time: DateTime(2023, 3, 21, 10, 0),
      status: 'Pending',
      location: '123 Main St',
    ),
    DoctorVisit(
      doctorName: 'Jane Smith',
      doctorSpecialty: 'Dermatologist',
      patientName: 'Bob Johnson',
      time: DateTime(2023, 3, 22, 13, 30),
      status: 'Done',
      location: '456 Elm St',
    ),
    DoctorVisit(
      doctorName: 'Bob Johnson',
      doctorSpecialty: 'Pediatrician',
      patientName: 'Charlie Brown',
      time: DateTime(2023, 3, 24, 9, 0),
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
              headerStyle: HeaderStyle(
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
                  return Card(
                    child: ListTile(
                      title: Text(visit.doctorName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Patient: ${visit.patientName}'),
                          Text('Specialty: ${visit.doctorSpecialty}'),
                          Text(
                            '${visit.time.hour}:${visit.time.minute} - ${visit.status} - ${visit.location}',
                          ),
                        ],
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

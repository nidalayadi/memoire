import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class DoctorVisit {
  String patientName;
  DateTime time;
  String status;
  String location;

  DoctorVisit({
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
        patientName: 'Alice Smith',
        time: DateTime(
            currentDate.year, currentDate.month, currentDate.day, 10, 0),
        status: 'Pending',
        location: '123 Main St',
      ),
      DoctorVisit(
        patientName: 'Bob Johnson',
        time: DateTime(
            currentDate.year, currentDate.month, currentDate.day, 13, 30),
        status: 'Done',
        location: '456 Elm St',
      ),
      DoctorVisit(
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
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 32,
            ),
            onPressed: () {
              Navigator.pop(
                  context); // Navigate back when the button is pressed
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
                                    vertical: 8.0,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(27, 107, 164, 1),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: ExpansionTile(
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            visit.patientName,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            '${visit.time.hour}:${visit.time.minute} - ${visit.status} - ${visit.location}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          // Additional information or actions can be added here
                                        ],
                                      ),
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
      ),
    );
  }
}

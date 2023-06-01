import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';

class DoctorReport {
  String doctorName;
  String doctorSpecialty;
  String patientName;
  DateTime time;
  String reportLink;

  DoctorReport({
    required this.doctorName,
    required this.doctorSpecialty,
    required this.patientName,
    required this.time,
    required this.reportLink,
  });
}

class raportListPatient extends StatefulWidget {
  const raportListPatient({Key? key}) : super(key: key);

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<raportListPatient> {
  DateTime _selectedDay = DateTime.now();

  List<DoctorReport> _doctorReports = [];

  void _onDaySelected(DateTime day) {
    setState(() {
      _selectedDay = day;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadDoctorReports();
  }

  void _loadDoctorReports() {
    DateTime currentDate = DateTime.now();
    _doctorReports = [
      DoctorReport(
        doctorName: 'John Doe',
        doctorSpecialty: 'Cardiologist',
        patientName: 'Alice Smith',
        time: DateTime(
            currentDate.year, currentDate.month, currentDate.day, 10, 0),
        reportLink: '',
      ),
      DoctorReport(
        doctorName: 'Jane Smith',
        doctorSpecialty: 'Dermatologist',
        patientName: 'Bob Johnson',
        time: DateTime(
            currentDate.year, currentDate.month, currentDate.day, 13, 30),
        reportLink: '',
      ),
      DoctorReport(
        doctorName: 'Bob Johnson',
        doctorSpecialty: 'Pediatrician',
        patientName: 'Charlie Brown',
        time: DateTime(
            currentDate.year, currentDate.month, currentDate.day, 9, 0),
        reportLink: '',
      ),
    ];
  }

  List<List<DoctorReport>> _groupReportsByHour() {
    Map<int, List<DoctorReport>> groupedReports = {};
    for (DoctorReport report in _doctorReports) {
      int hour = report.time.hour;
      if (groupedReports.containsKey(hour)) {
        groupedReports[hour]!.add(report);
      } else {
        groupedReports[hour] = [report];
      }
    }
    return groupedReports.values.toList();
  }

  void _handleContainerTap(DoctorReport report) {
    // Do something when the container is tapped
    print('Container tapped: ${report.doctorName}');
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
            'My Reports',
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
                  List<DoctorReport> reports = _groupReportsByHour()
                      .expand((reports) => reports)
                      .toList();

                  List<DoctorReport> hourReports = reports
                      .where((report) => report.time.hour == hourIndex)
                      .toList();

                  return hourReports.isNotEmpty
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
                              itemCount: hourReports.length,
                              separatorBuilder: (context, index) => Divider(),
                              itemBuilder: (context, index) {
                                DoctorReport report = hourReports[index];
                                return GestureDetector(
                                  onTap: () => _handleContainerTap(report),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 8.0,
                                    ),
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(27, 107, 164, 1),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Row(
                                        children: [
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
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ListTile(
                                            title: Row(
                                              children: [
                                                Text(
                                                  report.doctorName,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Patient: ${report.patientName}',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  'Specialty: ${report.doctorSpecialty}',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  '${report.time.hour}:${report.time.minute}',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
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

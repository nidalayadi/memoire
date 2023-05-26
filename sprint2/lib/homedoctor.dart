import 'package:flutter/material.dart';

class doctorhome extends StatefulWidget {
  const doctorhome({Key? key}) : super(key: key);

  @override
  State<doctorhome> createState() => _doctorhomeState();
}

class _doctorhomeState extends State<doctorhome> {
  var name = "Anis Boudaren";

  List<DoctorVisit> _doctorVisits = [];

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
            currentDate.year, currentDate.month, currentDate.day, 10, 00),
        status: 'Pending',
        location: 'Hospital A',
      ),
      DoctorVisit(
        doctorName: 'Jane Smith',
        doctorSpecialty: 'Dermatologist',
        patientName: 'Bob Johnson',
        time: DateTime(
            currentDate.year, currentDate.month, currentDate.day, 13, 30),
        status: 'Confirmed',
        location: 'Clinic B',
      ),
      DoctorVisit(
        doctorName: 'Bob Johnson',
        doctorSpecialty: 'Pediatrician',
        patientName: 'Charlie Brown',
        time: DateTime(
            currentDate.year, currentDate.month, currentDate.day, 9, 00),
        status: 'Completed',
        location: 'Hospital A',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1.0),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              // Perform log out action
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome Back ${name} !",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 25,
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.pink[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Align(
                  alignment: Alignment.center,
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
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.green[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Icon(
                      Icons.people,
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
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Icon(
                      Icons.assignment,
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
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.orange[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Icon(
                      Icons.calendar_today,
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
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Icon(
                      Icons.description,
                      size: 32,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nearest Appointment",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _doctorVisits.length,
              itemBuilder: (context, index) {
                DoctorVisit visit = _doctorVisits[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 111, 159, 222),
                          Color.fromRGBO(111, 178, 225, 1),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ExpansionTile(
                      title: Row(
                        children: [
                          Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${visit.time.hour}:${visit.time.minute.toString().padLeft(2, '0')}",
                                    style: TextStyle(
                                        color: Color.fromRGBO(111, 178, 225, 1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                ],
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                visit.doctorName,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Patient: ${visit.patientName}',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Specialty: ${visit.doctorSpecialty}',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                ' ${visit.status} - ${visit.location}',
                                style: TextStyle(color: Colors.white),
                              ),
                              // Additional information or actions can be added here
                            ],
                          ),
                        ],
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 7,
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.person,
                                      size: 32,
                                      color: Color.fromRGBO(111, 178, 225, 1),
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
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.cancel_outlined,
                                      size: 32,
                                      color: Color.fromRGBO(111, 178, 225, 1),
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
          ),
        ],
      ),
    );
  }
}

class DoctorVisit {
  final String doctorName;
  final String doctorSpecialty;
  final String patientName;
  final DateTime time;
  final String status;
  final String location;

  DoctorVisit({
    required this.doctorName,
    required this.doctorSpecialty,
    required this.patientName,
    required this.time,
    required this.status,
    required this.location,
  });
}

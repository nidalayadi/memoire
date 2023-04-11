import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<String> _items = [
    'Task 1',
    'Task 2',
    'Task 3',
  ];

  Map<String, bool> _checked = {
    'Task 1': false,
    'Task 2': false,
    'Task 3': false,
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gray Background App',
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[200], // Set the background color to gray
          body: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                width: 380,
                decoration: BoxDecoration(
                  color: Color(0xFF94B4FC),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 221, 221, 221),
                          borderRadius: BorderRadius.circular(50)),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/doctor.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Dr. Mouhmed Djakour",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text("psychologe", style: TextStyle(color: Colors.white)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "12:30 pm march ,20th,2023",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 150, 193, 228),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.medication,
                            color: Colors.white,
                            size: 40,
                          ),
                          Text("Today's meds",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          SizedBox(height: 10),
                          Container(
                            height: 220,
                            width: 150,
                            child: Expanded(
                              child: ListView.builder(
                                itemCount: _items.length,
                                itemBuilder: (context, index) {
                                  final item = _items[index];
                                  return CheckboxListTile(
                                    title: Text(
                                      item,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    value: _checked[item],
                                    onChanged: (value) {
                                      setState(() {
                                        _checked[item] = value!;
                                      });
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min, // set mainAxisSize to min
                      children: [
                        SizedBox(height: 5),
                        Flexible(
                          flex: 1, // set flex to 1
                          child: Container(
                            width: 190,
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Color(0xFF6890B0),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.monitor_heart_outlined,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Check and update your medical records",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                  textAlign: TextAlign
                                      .center, // set textAlign to center
                                ),
                                OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    primary: Colors
                                        .white, // Set the border color to white
                                    side: BorderSide(
                                        width: 1,
                                        color: Colors
                                            .white), // Set the border width and color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    "Check it",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Flexible(
                          flex: 1, // set flex to 1
                          child: Container(
                            width: 190,
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Color(0xFF94B4FC),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Icon(Icons.inbox,
                                      size: 40, color: Colors.white),
                                ),
                                Text(
                                  "Manage your appointments",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                  textAlign: TextAlign
                                      .center, // set textAlign to center
                                ),
                                OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    primary: Colors
                                        .white, // Set the border color to white
                                    side: BorderSide(
                                        width: 1,
                                        color: Colors
                                            .white), // Set the border width and color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    "Check it",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                width: 380,
                decoration: BoxDecoration(
                  color: Color(0xFF6890B0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 221, 221, 221),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/doctor.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Welcome back,",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          "Dr. Mouhmed Djakour",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          "psychologist",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle edit profile button press
                          },
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(fontSize: 15, color: Colors.white),
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
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'functions.dart' as func;

class profilePage2 extends StatefulWidget {
  const profilePage2({super.key});

  @override
  State<profilePage2> createState() => _profilePage2State();
}

class _profilePage2State extends State<profilePage2> {
  static const double _sizedBoxHeight = 50.0;
  static const TextStyle _doctorNameStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle _doctorProfessionStyle = TextStyle(
    fontSize: 18,
  );

  void _editProfile() async {
    // Show a dialog or navigate to an edit profile page
    // where user can update their information
    // You can implement the logic to update the information in your app
    // For this example, we'll just update the information in the state directly
    final updatedProfile = await showDialog(
      context: context,
      builder: (BuildContext context) {
        // Implement your edit profile dialog or page here
        return AlertDialog(
          title: Text('Edit Profile'),
          content: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Age'),
                onChanged: (value) {
                  setState(() {
                    _age = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Gender'),
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Address'),
                onChanged: (value) {
                  setState(() {
                    _address = value;
                  });
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> changes = {};
                if (_name != "") {
                  changes['name'] = _name;
                }
                if (_age != "") {
                  changes['age'] = _age;
                }
                if (_gender != "") {
                  changes['gender'] = _gender;
                }
                if (_address != "") {
                  changes['address'] = _address;
                }

                // Update the profile in the database
                // Replace this with your actual database update logic
                var response = await updateProfileInDatabase(changes);
                if (response.statusCode == 200) {
                  // Database update successful
                  var obj = jsonDecode(response.body);
                  Navigator.of(context).pop({
                    'name': obj["patient"]['firstName'],
                    'age': obj["patient"]['dateOfBirth'],
                    'gender': obj["patient"]['gender'],
                    'address': obj["patient"]['address'],
                  });
                } else {
                  // Handle database update failure
                  print('Failed to update profile in the database');
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );

    // Handle updated profile data
    if (updatedProfile != null) {
      setState(() {
        _name = updatedProfile['name'];
        _age = updatedProfile['age'];
        _gender = updatedProfile['gender'];
        _address = updatedProfile['address'];
      });
    }
  }

// Example function for updating the profile in the database
  Future<http.Response> updateProfileInDatabase(Map<String, dynamic> changes) {
    // Replace this with your actual API endpoint for updating the profile
    // using a POST or PUT request with the provided changes
    var url = 'https://example.com/api/update-profile';
    return http.put(
      Uri.parse(url),
      body: jsonEncode(changes),
      headers: {'Content-Type': 'application/json'},
    );
  }

  Map<String, dynamic>? obj;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    final response = await func.makeGetRequest();
    final responseData = json.decode(response);
    setState(() {
      obj = responseData['patient'];
    });
  }

  String calcAge(String dateOfBirth) {
    DateTime birthDateUtc = DateTime.parse(dateOfBirth);
    DateTime nowUtc = DateTime.now().toUtc();

    Duration difference = nowUtc.difference(birthDateUtc);

    int age = (difference.inDays / 365).floor();

    print('Age: $age'); // Output: Age: 33
    return age.toString();
  }

  String _name = "Anis Boudaren";
  String _age = "20";
  String _gender = "male";
  String _email = "anisboudaren2@gmail.com";
  String _address = "312 somthing somthing b5748 somthing";
  late final String _photoUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2OWYfnqgJ46PqJmkiw9s5mRyWvNm7WhvN524ApoIcALqy8aoi20JaW05I6i4ly2rVPnY&usqp=CAU';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add some spacing at the top of the widget
            const SizedBox(height: _sizedBoxHeight),
            // Create a row to display the doctor's information
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display the doctor's image
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF94B4FC),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    height: 210,
                    child: Image.asset(
                      'assets/doctor.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Display the doctor's name, profession, team, and gender
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display the doctor's name
                      Text(
                        _name,
                        style: _doctorNameStyle,
                        maxLines: 2,
                        overflow: TextOverflow
                            .fade, // Add overflow property to fade the text
                      ),
                      // Add some spacing between the doctor's name and profession
                      const SizedBox(height: 8),
                      // Display the doctor's profession
                      Text(
                        'Age: $_age',
                        style: _doctorProfessionStyle,
                      ), // Add some spacing between the doctor's name and profession
                      const SizedBox(height: 8),
                      // Display the doctor's profession
                      Text(
                        'Gender: $_gender',
                        style: _doctorProfessionStyle,
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              launchUrl(Uri.parse('tel:+2130794990784'));
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.green[100])),
                            child: const Icon(
                              Icons.phone,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                launchUrl(
                                    Uri.parse('mailto:nidal.ayadi2@gmail.com'));
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.orange[100])),
                              child: const Icon(
                                Icons.mail,
                                color: Colors.orange,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),

            const SizedBox(
              height: 15,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Address",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_pin),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              _address,
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.mail),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            _email,
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 200,
            ),

            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.list),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Medical records",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 150, 193, 228)),
                  minimumSize: MaterialStateProperty.all<Size>(Size(180, 70)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)))),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    "Edit profile",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[600]),
                  minimumSize: MaterialStateProperty.all<Size>(Size(180, 70)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)))),
            ),
          ],
        ),
      ),
    );
    ;
  }
}

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
    // _getData();
  }

  // Future<void> _getData() async {
  //   final response = await func.makeGetRequest();
  //   final responseData = json.decode(response);
  //   setState(() {
  //     obj = responseData['patient'];
  //   });
  // }

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
      appBar: CustomAppBar(
        image: 'assets/doctor.png',
        name: _name,
        radius: 20.0, // Set the desired border radius
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add some spacing at the top of the widget

            // Create a row to display the doctor's information

            const SizedBox(
              height: 25,
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
                        "Age :",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.calendar_month),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              _age,
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        color: Color.fromRGBO(27, 107, 164, 1),
                        thickness: 1,
                        height: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Gender :",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.person_2),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              _gender,
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        color: Color.fromRGBO(27, 107, 164, 1),
                        thickness: 1,
                        height: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Address :",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                      const Divider(
                        color: Color.fromRGBO(27, 107, 164, 1),
                        thickness: 1,
                        height: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Email :",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                const Divider(
                  color: Color.fromRGBO(27, 107, 164, 1),
                  thickness: 1,
                  height: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),

            // Add a line separator after each information
          ],
        ),
      ),
    );
    ;
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String image;
  final String name;
  final double radius;

  CustomAppBar({
    required this.image,
    required this.name,
    this.radius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 250,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(radius),
        ),
      ),
      elevation: 0.0,
      backgroundColor: Color.fromRGBO(27, 107, 164, 1),
      flexibleSpace: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 35),
            CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(image),
            ),
            SizedBox(height: 28),
            Text(
              name,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: IconButton(
                    icon: Icon(
                      Icons.file_download,
                      size: 28,
                    ),
                    color: Color.fromRGBO(27, 107, 164, 1),
                    onPressed: () {
                      // Handle call button pressed
                    },
                  ),
                ),
                SizedBox(
                  width: 32,
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: IconButton(
                    icon: Icon(
                      Icons.description,
                      size: 28,
                    ),
                    color: Color.fromRGBO(27, 107, 164, 1),
                    onPressed: () {
                      // Handle message button pressed
                    },
                  ),
                ),
                SizedBox(
                  width: 32,
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      size: 28,
                    ),
                    color: Color.fromRGBO(27, 107, 164, 1),
                    onPressed: () {
                      // Handle email button pressed
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(250);
}

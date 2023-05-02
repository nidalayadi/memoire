// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'functions.dart' as func;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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

  String _name = 'John Doe';
  String _age = '25';
  String _gender = 'Male';
  String _address = '1234 Main St, Springfield';
  late final String _photoUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2OWYfnqgJ46PqJmkiw9s5mRyWvNm7WhvN524ApoIcALqy8aoi20JaW05I6i4ly2rVPnY&usqp=CAU'; // Replace with actual photo URL

  // Edit profile information
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
                var boom = await func.makeGetRequest();
                Map<String, dynamic> obj = jsonDecode(boom);
                print(obj["patient"]['firstName']);
                Navigator.of(context).pop({
                  'name': obj["patient"]['firstName'],
                  'age': obj["patient"]['dateOfBirth'],
                  'gender': obj["patient"]['gender'],
                  'address': obj["patient"]['address'],
                });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: _editProfile,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(_photoUrl),
              radius: 80,
            ),
            SizedBox(height: 20),
            Text('Name: ${obj!["firstName"]}', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text('Age: ${calcAge(obj!['dateOfBirth'])}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Gender: ${obj!["gender"]}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Address: ${obj!["address"]}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

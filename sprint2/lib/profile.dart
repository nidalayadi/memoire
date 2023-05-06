import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = 'John Doe';
  String _age = '25';
  String _gender = 'Male';
  String _address = '1234 Main St, Springfield';
  String _photoUrl =
      'https://example.com/profile_photo.png'; // Replace with actual photo URL

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
              onPressed: () {
                Navigator.of(context).pop({
                  'name': _name,
                  'age': _age,
                  'gender': _gender,
                  'address': _address,
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
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(_photoUrl),
              radius: 80,
            ),
            SizedBox(height: 20),
            Text('Name: $_name',
                style: TextStyle(fontSize: 24, fontFamily: 'Arial')),
            SizedBox(height: 10),
            Text('Age: $_age',
                style: TextStyle(fontSize: 18, fontFamily: 'Arial')),
            SizedBox(height: 10),
            Text('Gender: $_gender',
                style: TextStyle(fontSize: 18, fontFamily: 'Arial')),
            SizedBox(height: 10),
            Text('Address: $_address',
                style: TextStyle(fontSize: 18, fontFamily: 'Arial')),
          ],
        ),
      ),
    );
  }
}

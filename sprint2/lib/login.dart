// ignore_for_file: use_build_context_synchronously, prefer_interpolation_to_compose_strings, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'functions.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passowrdController = TextEditingController();
  final _focusNode = FocusNode();
  String role = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 80),
            child: const Text(
              "Welcome\nBack",
              style: TextStyle(color: Colors.white, fontSize: 33),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                  top: MediaQuery.of(context).size.height * 0.5),
              child: Column(children: [
                TextField(
                  controller: _emailController,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _passowrdController,
                  focusNode: _focusNode,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Login In',
                      style: TextStyle(
                        color: Color(0xff4c505b),
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: const Color(0xff4c505b),
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () async {
                          var result = await login(
                              _emailController.text, _passowrdController.text);
                          if (result[0]) {
                            print("role : " + role);
                            if (result[1] == "Patient") {
                              Navigator.pushNamed(context, 'navigation');
                            } else if (result[1] == "Caregiver") {
                              Navigator.pushNamed(context, 'doctorHome');
                            }
                          } else {
                            _emailController.text = "who the hell are you ";
                          }
                        },
                        icon: const Icon(Icons.arrow_forward),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'register');
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Color(0xff4c505b),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Color(0xff4c505b),
                          ),
                        ),
                      ),
                    ]),
              ]),
            ),
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    _emailController.dispose();
    _passowrdController.dispose();
    super.dispose();
  }
}

Future<dynamic> login(String email, String password) async {
  print("we are inside");
  final url = Uri.parse(
      '${dotenv.env['ROOT_ENDPOINT']}/user/login'); // replace with your login URL
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json', // replace with your content type
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );
  print("this is the response : " + response.body);
  if (response.statusCode == 201) {
    print(response.body);
    String role = jsonDecode(response.body)['role'];
    await saveToken(jsonDecode(response.body)['token']);
    return [true, role];
  } else if (response.statusCode == 400) {
    print(response.body);
    return false;
  } else {
    throw Exception('Failed to login');
  }
}

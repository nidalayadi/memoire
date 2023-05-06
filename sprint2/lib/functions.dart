import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

// ignore: prefer_const_constructors
final storage = FlutterSecureStorage();

// Storing the token
Future<void> saveToken(String token) async {
  await storage.write(key: 'token', value: token);
}

// Retrieving the token
Future<String?> getToken() async {
  return await storage.read(key: 'token');
}

Future<String> makeGetRequest() async {
  final token = await storage.read(key: 'token');
  print(token);
  var url = '${dotenv.env["ROOT_ENDPOINT"]}/patient/get/me';
  final headers = {'Authorization': 'Bearer $token'};
  final response = await http.get(Uri.parse(url), headers: headers);
  print(response.body);
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load data');
  }
}

Future<String> sendPdf(url) async {
  final token = await storage.read(key: 'token');
  print(token);
// Create a multipart request with a file
  final file = File(url);
  final bytes = await file.readAsBytes();

  final request = http.MultipartRequest(
      'POST', Uri.parse('${dotenv.env["ROOT_ENDPOINT"]}/patient/newMedRec'));

  request.headers.addAll({
    HttpHeaders.authorizationHeader: 'Bearer $token',
  });
// Add the PDF file to the request
  final bfile = http.MultipartFile.fromBytes('pdf', bytes);

  request.files.add(bfile);

// Send the request
  var response = await request.send();
  print("this");

  // ignore: unused_local_variable
  final realfile = await response.stream.toBytes();
  print(realfile);
  var res = await writeToFile(realfile,
      '/data/user/0/com.example.sprint2/cache/justcreaetthedamfile.pdf');
  print(res);

// Check the response status
  if (response.statusCode == 200) {
    print('PDF file uploaded successfully!');
    return "PDF file uploaded successfully!";
  } else {
    print('Error uploading PDF file: ${response.statusCode}');
    return "Error uploading PDF file!";
  }
}

Future<String> writeToFile(Uint8List data, String path) async {
  final file = File(path);
  await file.writeAsBytes(data);
  return file.path;
}

Future<String> updateProfile(Object params) async {
  final token = await storage.read(key: 'token');
  print(token);
  var url = '${dotenv.env["ROOT_ENDPOINT"]}/patient/update/me';
  final headers = {'Authorization': 'Bearer $token'};
  final response =
      await http.put(Uri.parse(url), body: params, headers: headers);
  print(response.body);
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to update profile');
  }
}

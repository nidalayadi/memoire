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

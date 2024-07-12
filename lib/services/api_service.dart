import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models//user.dart';

class ApiService {
  final String apiUrl =
      'https://gvff6njg6kts-mock.migratech.cloud/api/contacts';

  Future<void> sendContact(User user) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toMap()),
    );

    if (response.statusCode != 200) {
      throw Exception('Falha ao enviar contato!');
    }
  }
}

import 'dart:convert';
import 'package:fulltime_force/src/models/commits.model.dart';
import 'package:http/http.dart' as http;

class DataProvider {
  final String URL = "api.github.com";

  String? errorMessage;

  final Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<List<Commits>?> getCommits() async {
    var uri = Uri.https(
      URL,
      '/repos/Edu42x/fulltime_force/commits',
    );

    final res = await http.get(uri, headers: headers);

    if (res.statusCode == 200) {
      final List<dynamic> parsed = jsonDecode(res.body);
      return parsed.map((json) => Commits.fromJson(json)).toList();
    } else {
      errorMessage = "Error al consumir la api";
    }

    return [];
  }
}

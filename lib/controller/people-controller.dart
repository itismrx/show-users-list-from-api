import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rabii/model/people.dart';

Future<List<People>> fetchPeople() async {
  String uri = "https://61ee4c48d593d20017dbad43.mockapi.io/api/users/newUsers";
  final response = await http.get(Uri.parse(uri));
  if (response.statusCode == 200) {
    List<People> _people = [];
    final json = jsonDecode(response.body);
    // People.fromJson(jsonDecode(response.body));

    json.forEach((person) {
      _people.add(People.fromJson(person));
    });
    print("People Length");
    print(_people.length);
    return _people;
  } else {
    throw Exception("Failed to get People data");
  }
}

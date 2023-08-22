import 'dart:convert';

import 'package:http/http.dart' as http;

Future fetch({required String url}) async {
  http.Response res = await http.get(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
  );
  if (res.statusCode == 200 || res.statusCode == 201) {
    return jsonDecode(res.body);
  }
  return null;
}

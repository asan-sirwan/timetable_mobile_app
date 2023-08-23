import 'dart:convert';

import 'package:http/http.dart' as http;

Future send({required String url, required Map data}) async {
  http.Response res = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(data),
  );
  return jsonDecode(res.body);
}

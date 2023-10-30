import 'dart:convert';
import 'constants.dart';

import 'package:http/http.dart' as http;

enum Method { get, post }

class Fetcher {
  static Future<void> fetch({
    required Method method,
    required String path,
    required String publicKey,
    Map<String, dynamic>? payloads,
  }) async {
    var url = Uri.parse('$apiURL$path');
    try {
      http.Response response;
      if (method == Method.get) {
        response = await http.get(
          url,
          headers: {
            'Content-Type': 'application/json',
            'Api-Public-Key': publicKey,
            'Authorization': 'Bearer $publicKey',
          },
        );
      } else if (method == Method.post) {
        response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'Api-Public-Key': publicKey,
          },
          body: json.encode(payloads),
        );
      } else {
        throw Exception("Unknown Method! supported [get and post]");
      }
      return json.decode(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}

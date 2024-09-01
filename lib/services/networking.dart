import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    Uri uri = Uri.parse(url); // Convert the String url to a Uri object
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data); // Return the decoded JSON data
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized: Check your API key');
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}

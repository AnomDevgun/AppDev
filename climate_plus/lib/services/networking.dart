import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response weatherResponse = await http.get(url);
    if (weatherResponse.statusCode == 200) {
      String data = weatherResponse.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(weatherResponse.statusCode);
    }
  }
}

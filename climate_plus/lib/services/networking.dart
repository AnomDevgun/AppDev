import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:retry/retry.dart';
import 'dart:io';
import 'dart:async';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    final weatherResponse = await retry(
      () => http.get(url).timeout(Duration(seconds: 3)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    if (weatherResponse.statusCode == 200) {
      String data = weatherResponse.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(weatherResponse.statusCode);
    }
  }
}

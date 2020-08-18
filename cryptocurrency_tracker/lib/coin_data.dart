import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';
import 'components/keys.dart';
import 'dart:async';
import 'dart:io';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future networkHelper(String currentCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypt in cryptoList) {
      String requestUrl =
          'https://rest.coinapi.io/v1/exchangerate/$crypt/$currentCurrency?apikey=$coinApi';
      http.Response apiResponse = await retry(
        () => http.get(requestUrl).timeout(Duration(seconds: 2)),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      if (apiResponse.statusCode == 200) {
        String data = apiResponse.body;
        var decodedData = jsonDecode(data);
        var rate = (decodedData['rate']);
        cryptoPrices[crypt] = rate.toStringAsFixed(0);
      } else {
        print(apiResponse.statusCode);
        throw 'Problem with the api request';
      }
    }
    return cryptoPrices;
  }
}

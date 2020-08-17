import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'components/crypto_card.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList[0];
  String currentExchange = '0';
  CoinData coinData = CoinData();

  Map<String, String> coinValues = {};
  bool isWaiting = false;

  void getData() async {
    isWaiting = true;
    try {
      var data = await coinData.networkHelper(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  DropdownButton<String> getDropDownButton() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
        isDense: false,
        value: selectedCurrency,
        items: dropDownItems,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
            getData();
          });
        });
  }

  CupertinoPicker iOSPicker() {
    List<Text> populatedList = [];
    for (String currency in currenciesList) {
      var newItem = Text('$currency');
      populatedList.add(newItem);
    }
    return CupertinoPicker(
      backgroundColor: Color(0xff0092A2),
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getData();
        });
      },
      children: populatedList,
    );
  }

  Widget getPicker() {
    if (Platform.isIOS) {
      return iOSPicker();
    } else {
      return getDropDownButton();
    }
  }

  Column makeCards() {
    List<CryptoCard> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(
        CryptoCard(
          cryptoCurrency: crypto,
          selectedCurrency: selectedCurrency,
          value: isWaiting ? '?' : coinValues[crypto],    //if iswaiting == true then set to '?' else lookup val in map and assign
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Cryptocurrency Tracker'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          FlareActor(
            'assets/Background_alt.flr',
            animation: 'Blue',
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                  child: makeCards(),
                ),
                Opacity(
                  opacity: 0.97,
                  child: Container(
                    height: 150.0,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 30.0),
                    color: Color(0xff0092A2),
                    child: getPicker(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

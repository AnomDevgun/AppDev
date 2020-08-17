import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList[0];

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
        print(selectedIndex);
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
                  child: Card(
                    color: Color(0xff0092A2),
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 28.0),
                      child: Text(
                        '1 BTC = ? USD',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
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

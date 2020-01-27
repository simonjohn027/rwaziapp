import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rwazi/models/Countries.dart';
import '../auth/widget/phoneAuthWidget.dart';
import 'package:rwazi/auth/verification.dart';
import 'package:rwazi/auth/firebase_implementation.dart';
import '../auth/firebase_instantiate.dart';


class PhoneAuthGetPhone extends StatefulWidget {

  Color cardBackgroundColor = Color(0xFF100F0F);
  String appName = "Rwazi";


  @override
  _PhoneAuthGetPhoneState createState() => _PhoneAuthGetPhoneState();
}

class _PhoneAuthGetPhoneState extends State<PhoneAuthGetPhone> {

  double _height, _width,_fixedPadding;

  List<Country> countries = [];
  StreamController<List<Country>> _countriesStreamController;
  Stream<List<Country>> _countriesStream;
  Sink<List<Country>> _countriesSink;


  TextEditingController _searchCountryController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();


  int _selectedCountryIndex = 140;
  bool _isCountriesDataFormed = false;


  @override
  void dispose() {
    //_countriesSink.close();
   // _countriesStreamController.close();
    _searchCountryController.dispose();
    super.dispose();
  }


  Future<List<Country>> loadCountriesJson() async{
    countries.clear();

    var value = await DefaultAssetBundle.of(context).loadString('data/countries_phone.json');

    var countriesJson = json.decode(value);

    for(var country in countriesJson){
      countries.add(Country.fromJson(country));
    }
    return countries;
  }


  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _fixedPadding = _height *0.025;

    WidgetsBinding.instance.addPostFrameCallback((Duration d){
      if(countries.length < 240){
        loadCountriesJson().whenComplete((){
          setState(() {
            _isCountriesDataFormed = true;
          });
        });
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:Card(
              color: widget.cardBackgroundColor,
              elevation: 2.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              child: SizedBox(
                height: _height * 8 / 10,
                width: _width * 8 / 10,
                child: _isCountriesDataFormed
                    ? _getColumnBody()
                    : Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        ),
      ),
    );

  }
  Widget _getColumnBody()=> Column(
    mainAxisSize:  MainAxisSize.min,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.all(_fixedPadding),
        child: Text(
          "Rwazi",
        ),
      ),
      Text(
        widget.appName,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight:  FontWeight.w700,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: _fixedPadding, left: _fixedPadding),
        child: PhoneAuthWidgets.subTitle('Select your country'),
      ),
      Padding(
        padding: EdgeInsets.only(left: _fixedPadding, right: _fixedPadding),
        child: PhoneAuthWidgets.selectCountryDropDown(
            countries[_selectedCountryIndex], showCountries),
      ),

      //  Subtitle for Enter your phone
      Padding(
        padding: EdgeInsets.only(top: 10.0, left: _fixedPadding),
        child: PhoneAuthWidgets.subTitle('Enter your phone'),
      ),
      //  PhoneNumber TextFormFields
      Padding(
        padding: EdgeInsets.only(
            left: _fixedPadding,
            right: _fixedPadding,
            bottom: _fixedPadding),
        child: PhoneAuthWidgets.phoneNumberField(_phoneNumberController,
            countries[_selectedCountryIndex].dialCode),
      ),

      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(width: _fixedPadding),
          Icon(Icons.info, color: Colors.white, size: 20.0),
          SizedBox(width: 10.0),
          Expanded(
            child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'We will send ',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: 'One Time Password',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700)),
                  TextSpan(
                      text: ' to this mobile number',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400)),
                ])),
          ),
          SizedBox(width: _fixedPadding),

        ],
      ),

      SizedBox(height: _fixedPadding * 1.5),

      RaisedButton(
        elevation: 16.0,
        onPressed: startPhoneAuth,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'SEND OTP',
            style: TextStyle(
                color: widget.cardBackgroundColor, fontSize: 18.0),
          ),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)),
      ),

    ],
  );

  showCountries() {
    /*
     * Initialising components required for StreamBuilder
     * We will not be using _countriesStreamController anywhere, but just to initialize Stream & Sink from that
     * _countriesStream will give us the data what we need(output) - that will be used in StreamBuilder widget
     * _countriesSink is the place where we send the data(input)
     */
    _countriesStreamController = StreamController();
    _countriesStream = _countriesStreamController.stream;
    _countriesSink = _countriesStreamController.sink;
    _countriesSink.add(countries);

    _searchCountryController.addListener(searchCountries);

    showDialog(
        context: context,
        builder: (BuildContext context) => searchAndPickYourCountry(),
        barrierDismissible: false);
  }


  searchCountries(){
    String query = _searchCountryController.text;

    if(query.length == 0 || query.length ==1){
      if(!_countriesStreamController.isClosed)_countriesSink.add(countries);
    }

    else if(query.length >= 2 && query.length <= 5){
      List<Country> searchResult = [];

      searchResult.clear();

      countries.forEach((Country country){
        if(country.toString().toLowerCase().contains(query.toLowerCase())){
          searchResult.add(country);
        }
      });

      _countriesSink.add(searchResult);

    }
    else{
      List<Country> searchResults = [];
      _countriesSink.add(searchResults);
    }
  }

  Widget searchAndPickYourCountry() => WillPopScope(
    onWillPop: ()=> Future.value(false),
    child: Dialog(
      key:Key('SearchCountryDialog'),
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        margin:const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            PhoneAuthWidgets.searchCountry(_searchCountryController),
            SizedBox(
              height: 250.0,
              child: StreamBuilder<List <Country>>(
                stream: _countriesStream,
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return snapshot.data.length == 0
                        ? Center(
                      child: Text('Your Search found no result',
                      style: TextStyle(fontSize: 16.0),),
                    )
                        : ListView.builder(

                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index)=>
                      PhoneAuthWidgets.selectableWidget(
                          snapshot.data[index],
                              (Country country)=> selectThisCountry(country)),
                    );
                  }
                  else if (snapshot.hasError){
                    return Center(
                      child: Text('Seems this is an error',
                      style: TextStyle(fontSize:16.0),),
                    );

                  }
                  return Center(child:  CircularProgressIndicator(),);
                },
              ),
            )
          ],
        ),
      ),
    ),
  );


  void selectThisCountry(Country country) {
    print(country);
    _searchCountryController.clear();
    Navigator.of(context).pop();
    Future.delayed(Duration(milliseconds: 10)).whenComplete(() {
      _countriesStreamController.close();
      _countriesSink.close();

      setState(() {
        _selectedCountryIndex = countries.indexOf(country);
      });
    });
  }


  startPhoneAuth(){
    FirebasePhoneAuth.instantiate(
        phoneNumber: countries[_selectedCountryIndex].dialCode +
            _phoneNumberController.text);

    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => PhoneAuthVerify()));
  }


}

import 'dart:async';
import 'dart:convert';





import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'mPInPage.dart';


SharedPreferences preferences;
String id = "";
var pin ;



class SetPin extends StatefulWidget {

  final String currentAdvisorID;
  SetPin({Key key, @required this.currentAdvisorID}) : super(key: key);
  @override
  _SetPinState createState() => _SetPinState(currentAdvisorID: currentAdvisorID);
}

class _SetPinState extends State<SetPin> {
  String currentAdvisorID;
  _SetPinState({@required this.currentAdvisorID});
  final _formKey = GlobalKey<FormState>();
  var val;



  TextEditingController pinCon;

  final _pinController = TextEditingController();


  Future setMPin() async {

    String pin = _pinController.text;
    var url = 'http://sanjayagarwal.in/Finance App/mPinAdvisor.php';
    print("****************************************************");
    print(pin);
    print(currentAdvisorID);

    print("****************************************************");
    String id = '0';
    print(id);
    final response = await http.post(
      url,
      body: jsonEncode(<String, String>{
        "UserID": currentAdvisorID,
        "mPin": pin,
        "id" : id
      }),
    );
    var message = jsonDecode(response.body);
    if (message["message"] == "Successful") {
      print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
      print(currentAdvisorID);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PassCodeScreen(
                currentAdvisorID: currentAdvisorID,
              )));
      print(currentAdvisorID);
    } else {
      print(message["message"]);
    }
  }

  String validatePin1(String value) {
    if (value.isEmpty) {
      _loading = false;
      return 'Pin must not be blank';
    } else if (value.length > 4) {
      _loading = false;
      return 'Pin must be of 4 digits';
    } else
      return null;
  }
  bool _loading = false;

  bool _autoValidate = false;
  void _validateInputs() {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      _formKey.currentState.save();
      setMPin();
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  bool _isHidden2 = true;

  void _toggleVisibility2() {
    setState(() {
      _isHidden2 = !_isHidden2;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(60),
                        child: Container(
                          child: Text(
                            'Security Pin',
                            style: TextStyle(
                                fontSize: width * 0.1,
                                color: Color(0xff373D3F)),
                          ),
                        ),
                      ),
                      Form(
                          key: _formKey,
                          autovalidate: _autoValidate,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  obscureText: _isHidden,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: ("Enter Pin"),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            0.5),
                                      ),

                                      suffixIcon: IconButton(
                                        onPressed: _toggleVisibility,
                                        icon: Icon(Icons.visibility_off),
                                      )
                                  ),
                                  validator: validatePin1,
                                  // validator: (String value1) {
                                  //   val = value1;
                                  //   Fluttertoast.showToast(msg: val);
                                  //   if (value1.isEmpty) {
                                  //     return 'Please enter a security pin';
                                  //   }
                                  //   if (value1.length > 4) {
                                  //     return 'Pin must contain four digits only. ';
                                  //   }
                                  //   return null;
                                  // },
                                  controller: _pinController,
                                  onSaved: (value) {},
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  obscureText: _isHidden2,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: ("Re-enter Pin"),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            0.5),
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: _toggleVisibility2,
                                        icon: Icon(Icons.visibility_off),
                                      )
                                  ),
                                  validator: (val) {
                                    if (val.isEmpty)
                                      return 'Pin field cannot be empty';
                                    if (val != _pinController.text) return 'Pins do not match';
                                    return null;
                                  },
                                  onSaved: (value) {},
                                ),
                              ],
                            ),
                          )
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RaisedButton(
                        onPressed: (){
                          setState(() {
                            _loading = true;
                          });
                          _validateInputs();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'SET PIN',
                            style: TextStyle(
                                color: Color(0xff373D3F),
                                fontSize: width * 0.05),
                          ),
                        ),
                        color: Color(0xff63E2E0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
  Future<Null> printPin(){
    Fluttertoast.showToast(msg: pin);
  }



}






























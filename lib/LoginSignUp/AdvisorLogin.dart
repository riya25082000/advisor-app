import 'dart:convert';

import 'package:advisorapplication/LoginSignUp/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:string_validator/string_validator.dart' as st_validator;
import 'package:http/http.dart' as http;

import '../NewAdvisorHomePage.dart';

class AdvisorLogin extends StatefulWidget {
  @override
  _AdvisorLoginState createState() => _AdvisorLoginState();
}

class _AdvisorLoginState extends State<AdvisorLogin> {
  var val;
  String currentAdvisorID;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  Future LoginAdvisor() async {
    var url = 'http://sanjayagarwal.in/Finance App/AdvisorApp/AdvisorLogin.php';
    final response = await http.post(
      url,
      body: jsonEncode(<String, String>{
        "Email": email,
        "Password": password,
      }),
    );
    var message = jsonDecode(response.body);
    print("************************************");
    print(message);
    if (message == "Invalid Username or Password Please Try Again") {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Login Error"),
            content: Text("The Email or Password is Invalid."),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdvisorLogin()));
                },
                child: Text("Ok"),
              )
            ],
          );
        },
      );
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('advisorid', message.toString());
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AdvisorHomePage1(
                    currentAdvisorID: message.toString(),
                  )));
    }
  }

  String email, password;
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) {
      _loading = false;
      return 'Please enter a valid email';
    } else if (!regex.hasMatch(value)) {
      _loading = false;
      return 'Enter Valid Email';
    } else
      return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      _loading = false;
      return 'Please enter a password';
    } else if (value.length < 8) {
      _loading = false;
      return 'Password must be greater than 8 alphabets';
    } else {
      return null;
    }
  }

  bool _loading = false;
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  void _validateInputs() {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      _formKey.currentState.save();
      LoginAdvisor();
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget loadingIndicator = _loading
        ? new Container(
            width: 70.0,
            height: 70.0,
            child: new Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Center(
                    child: new CircularProgressIndicator(
                  backgroundColor: Color(0xff63E2E0),
                ))),
          )
        : new Container();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Container(
              height: height,
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
                          'LOGIN',
                          style: TextStyle(
                              fontSize: width * 0.1, color: Color(0xff373D3F)),
                        ),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      autovalidate: _autoValidate,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            decoration: textfield("Email"),
                            validator: validateEmail,
                            onSaved: (v1) {
                              email = v1;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: _isHidden,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                hintText: ' Password',
                                hintStyle: TextStyle(color: Color(0xff373D3F)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff63E2E0),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.5),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: _toggleVisibility,
                                  icon: Icon(Icons.visibility_off),
                                )),
                            validator: validatePassword,
                            onSaved: (v2) {
                              password = v2;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Text('Forgot Password?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width * 0.04,
                                  color: Color(0xff373D3F))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          _loading = true;
                        });
                        _validateInputs();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: width * 0.05, color: Color(0xff373D3F)),
                        ),
                      ),
                      color: Color(0xff63E2E0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    new Align(
                      child: loadingIndicator,
                      alignment: FractionalOffset.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

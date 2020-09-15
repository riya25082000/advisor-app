import 'package:advisorapplication/LoginSignUp/widgets.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as st_validator;

import 'AdvisorSignUp.dart';

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

  @override
  Widget build(BuildContext context) {
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
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            decoration: textfield("Phone Number/ Email"),
                            validator: (value1) {
                              if (value1.isEmpty) {
                                return 'Please enter an email address';
                              }
                              if (st_validator.isEmail(value1)) {
                                return 'Enter a valid email address';
                              }
                              if (value1.split('@').length != 2) {
                                return 'Enter a valid email address';
                              }
                              return null;
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
                            validator: (String value) {
                              val = value;
                              if (value.isEmpty) {
                                return 'Please enter a password';
                              }
                              if (value.length < 8) {
                                return 'Password must be greater than 8 alphabets';
                              }
                              return null;
                            },
                            onSaved: (value) {},
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
                      onPressed: () {},
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'New Advisor? ',
                          style: TextStyle(
                              color: Color(0xff373D3F), fontSize: width * 0.04),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        AdvisorSignUp()));
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff63E2E0),
                                fontSize: width * 0.04),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            color: Color(0xff616161),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              color: Color(0xff373D3F),
                              fontSize: width * 0.04,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color(0xff616161),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: FlatButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/google.jpg',
                                height: 50, width: 40),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Login with Google',
                              style: TextStyle(
                                color: Color(0xff373D3F),
                                fontSize: width * 0.04,
                              ),
                            ),
                          ],
                        ),
                      ),
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

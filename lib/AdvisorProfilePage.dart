import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as st_validator;
import 'dart:convert';
import 'package:http/http.dart' as http;

class AdvisorProfile extends StatefulWidget {
  String currentAdvisorID;
  AdvisorProfile({@required this.currentAdvisorID});
  @override
  _AdvisorProfileState createState() =>
      _AdvisorProfileState(currentAdvisorID: currentAdvisorID);
}

class _AdvisorProfileState extends State<AdvisorProfile> {
  String currentAdvisorID;
  _AdvisorProfileState({@required this.currentAdvisorID});
  final _IDcontroller = TextEditingController();
  final _Namecontroller = TextEditingController();
  final _Mobcontroller = TextEditingController();
  final _Emailcontroller = TextEditingController();

  String advisorMobile;
  String advisorID = '1234';
  bool isEditing = false;
  String advisorName;
  String advisorEmail;
  String advisorAverageRating;

  String name = '', mobile = '', email = '';

  void getUserData() async {
    var url =
        'http://sanjayagarwal.in/Finance App/AdvisorApp/ProfilePage/AdvisorDetails.php';
    final response = await http.post(
      url,
      body: jsonEncode(<String, String>{
        'AdvisorID': currentAdvisorID,
      }),
    );
    var message = await jsonDecode(response.body);
    print("****************************************");
    print(message);
    print("****************************************");
    setState(() {
      name = message[0]['Name'];
      mobile = message[0]['Mobile'];
      email = message[0]['Email'];
    });
    print(name);
    print(mobile);
    print(email);
  }

  void profileUpdate() async {
    var url =
        'http://sanjayagarwal.in/Finance App/AdvisorApp/ProfilePage/AdvisorUpdate.php';
    final response1 = await http.post(
      url,
      body: jsonEncode(<String, String>{
        'AdvisorID': currentAdvisorID,
        'Name': name,
        'Mobile': mobile,
        'Email': email,
      }),
    );
    var message1 = await jsonDecode(response1.body);
    if (message1 == "Successful Updation") {
      print("Successfully Updated");
      getUserData();
    } else {
      print(message1);
    }
  }

  void switchState() {
    if (isEditing) {
      isEditing = false;
    } else {
      isEditing = true;
    }
  }

  void updateUserData() {
    if (_IDcontroller.text.isNotEmpty) {
      advisorID = _IDcontroller.text;
    }
    if (_Namecontroller.text.isNotEmpty) {
      advisorName = _Namecontroller.text;
    }
    if (_Mobcontroller.text.isNotEmpty) {
      advisorMobile = _Mobcontroller.text;
    }
    if (_Emailcontroller.text.isNotEmpty) {
      advisorEmail = _Emailcontroller.text;
    }

    //function to update the data of user to sync database
  }

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    getUserData();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _IDcontroller.dispose();
    _Namecontroller.dispose();
    _Mobcontroller.dispose();
    _Emailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double tileHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advisor Profile',
          style: TextStyle(
            color: Color(0xff373D3F),
          ),
        ),
        backgroundColor: Color(0xff63E2E0),
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Color(0xff373D3F),
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isEditing) {
            updateUserData();
          }
          setState(() {
            switchState();
          });
          profileUpdate();
          // Add your onPressed code here!
        },
        child: isEditing ? Icon(Icons.save) : Icon(Icons.edit),
        backgroundColor: Color(0xff32D8FF),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Name',
                    style: TextStyle(
                      fontSize: tileHeight / 40,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    height: tileHeight / 80,
                  ),
                  isEditing
                      ? TextFormField(
                          initialValue: name,
                          onChanged: (value) {
                            name = value;
                          },
                        )
                      : Text(
                          '$name',
                          style: TextStyle(
                            fontSize: tileHeight / 55,
                            color: Colors.black45,
                          ),
                        ),
                  isEditing
                      ? SizedBox()
                      : Divider(
                          color: Colors.black45,
                        ),
                  SizedBox(
                    height: tileHeight / 40,
                  ),
                  Text(
                    'Mobile Number',
                    style: TextStyle(
                      fontSize: tileHeight / 40,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    height: tileHeight / 80,
                  ),
                  isEditing
                      ? TextFormField(
                          initialValue: mobile,
                          onChanged: (value) {
                            mobile = value;
                          },
                        )
                      : Text(
                          '$mobile',
                          style: TextStyle(
                            fontSize: tileHeight / 55,
                            color: Colors.black45,
                          ),
                        ),
                  isEditing
                      ? SizedBox()
                      : Divider(
                          color: Colors.black45,
                        ),
                  SizedBox(
                    height: tileHeight / 40,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: tileHeight / 40,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    height: tileHeight / 80,
                  ),
                  isEditing
                      ? TextFormField(
                          initialValue: email,
                          onChanged: (value) {
                            email = value;
                          },
                        )
                      : Text(
                          '$email',
                          style: TextStyle(
                            fontSize: tileHeight / 55,
                            color: Colors.black45,
                          ),
                        ),
                  isEditing
                      ? SizedBox()
                      : Divider(
                          color: Colors.black45,
                        ),
                  SizedBox(
                    height: tileHeight / 40,
                  ),
                  SizedBox(
                    height: tileHeight / 80,
                  ),
                  SizedBox(
                    height: tileHeight / 40,
                  ),
                  SizedBox(
                    height: tileHeight / 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as st_validator;

class AdvisorProfile extends StatefulWidget {
  @override
  _AdvisorProfileState createState() => _AdvisorProfileState();
}

class _AdvisorProfileState extends State<AdvisorProfile> {
  final _IDcontroller = TextEditingController();
  final _Namecontroller = TextEditingController();
  final _Mobcontroller = TextEditingController();
  final _Emailcontroller = TextEditingController();
  final _Ratingcontroller = TextEditingController();

  String advisorMobile;
  String advisorID;
  bool isEditing = false;
  String advisorName;
  String advisorEmail;
  String advisorAverageRating;

  void getUserData() {
    //function to get user data
    advisorMobile = '9564832178';
    advisorID = '023SDE';
    advisorName = 'Suraj';
    advisorEmail = 'abc@gmail.com';
    advisorAverageRating = '4.3';
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
    if (_Ratingcontroller.text.isNotEmpty) {
      advisorAverageRating = _Ratingcontroller.text;
    }

    //function to update the data of user to sync database
  }

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  void dispose() {
    _IDcontroller.dispose();
    _Namecontroller.dispose();
    _Mobcontroller.dispose();
    _Emailcontroller.dispose();
    _Ratingcontroller.dispose();
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
                    'Advisor ID',
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
                          controller: _IDcontroller,
                        )
                      : Text(
                          '$advisorID',
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
                          controller: _Namecontroller,
                        )
                      : Text(
                          '$advisorName',
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
                          controller: _Mobcontroller,
                        )
                      : Text(
                          '$advisorMobile',
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
                          controller: _Emailcontroller,
                        )
                      : Text(
                          '$advisorEmail',
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
                    'Average Rating',
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
                          controller: _Ratingcontroller,
                        )
                      : Text(
                          '$advisorAverageRating',
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

import 'package:flutter/material.dart';

import 'InsuranceButtons.dart';

class InsuranceHomePage extends StatefulWidget {
  String currentUserID;
  InsuranceHomePage({@required this.currentUserID});
  @override
  _InsuranceHomePageState createState() => _InsuranceHomePageState(currentUserID: currentUserID);
}

class _InsuranceHomePageState extends State<InsuranceHomePage> {
  String currentUserID;
  _InsuranceHomePageState({@required this.currentUserID});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xff373D3F),
        ),
        backgroundColor: Color(0xff63E2E0),
        centerTitle: true,
        title: Text(
          'INSURANCE',
          style: TextStyle(color: Color(0xff373D3F)),
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Material(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: insurancebuttons("assets/images/health.png",
                          "Health Insurance", "ABCD", height),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: insurancebuttons("assets/images/family.jpg",
                          "Term Life Insurance", "ABCD", height),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: insurancebuttons("assets/images/car1.png",
                          "Car Insurance", "ABCD", height),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: insurancebuttons("assets/images/bike1.jpg",
                          "Bike Insurance", "ABCD", height),
                    )
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

import 'package:advisorapplication/tabview.dart';
import 'package:flutter/material.dart';

import 'AdvisorMenu.dart';

class AdvisorHomePage1 extends StatefulWidget {
  String currentAdvisorID;
  AdvisorHomePage1({@required this.currentAdvisorID});
  @override
  _AdvisorHomePageState createState() =>
      _AdvisorHomePageState(currentAdvisorID: currentAdvisorID);
}

class _AdvisorHomePageState extends State<AdvisorHomePage1> {
  String currentAdvisorID;
  _AdvisorHomePageState({@required this.currentAdvisorID});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xff373D3F),
        ),
        backgroundColor: Color(0xff63E2E0),
        centerTitle: true,
        title: Text(
          'HOME',
          style: TextStyle(
            color: Color(0xff373D3F),
          ),
        ),
      ),
      drawer: Drawer(
        child: AdvisorMenu(
          currentAdvisorID: currentAdvisorID,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 50),
                child: Text("YOUR LOGO"),
              ),
            ),
            Divider(),
            Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    image: AssetImage('images/mg.JPG'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular((20)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5, // soften the shadow
                    spreadRadius: 5, //extend the shadow
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Demo Advisory',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10, left: 10, bottom: 5),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'AUM',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 0, left: 10, bottom: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Rs.50,93,43,569',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10, top: 5),
                          child: Text(
                            'No of clients',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            'No of SIP',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 5, right: 10),
                          child: Text(
                            'SIP per month',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10, top: 5),
                          child: Text(
                            '3224',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 5, left: 40),
                          child: Text(
                            '1242',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 5, right: 10),
                          child: Text(
                            'Rs.29,94,099',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(5),

                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    // color: Colors.green,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((20)),
                image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    image: AssetImage("images/mg.JPG"),
                    fit: BoxFit.cover),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5, // soften the shadow
                    spreadRadius: 5, //extend the shadow
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Total',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 10, bottom: 5),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(right: 75),
                                      child: Text('Debt',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                          ))),
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: 0, left: 15, bottom: 10),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Rs.50,93,43,569',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ])),
                        Container(
                            margin:
                                EdgeInsets.only(top: 10, left: 10, bottom: 5),
                            alignment: Alignment.topLeft,
                            child: Column(children: [
                              Container(
                                  margin: EdgeInsets.only(right: 90),
                                  child: Text('Equity',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ))),
                              Container(
                                  margin: EdgeInsets.only(
                                      top: 0, bottom: 10, right: 10),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Rs.16,67,99,512',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ])),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 15, top: 5),
                          child: Text(
                            'Liquid and Ultrashoot',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 5, left: 35),
                          child: Text(
                            'Others',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 5, right: 10, left: 65),
                          child: Text(
                            'Arbitrage',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            '8,56,57,499',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 5, left: 40),
                          child: Text(
                            '23,38,573',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            '4,50,99,448',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(5),

                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    // color: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:advisorapplication/tabview.dart';
import 'package:flutter/material.dart';

import 'AdvisorMenu.dart';

class AdvisorHomePage extends StatefulWidget {
  @override
  _AdvisorHomePageState createState() => _AdvisorHomePageState();
}

class _AdvisorHomePageState extends State<AdvisorHomePage> {
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
          child: AdvisorMenu(),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1.0, // soften the shadow
                                  spreadRadius: 0, //extend the shadow
                                ),
                              ]),
                          height: height * 0.3,
                          width: width * 0.8,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Users',
                                  style: TextStyle(
                                    color: Color(0xff373D3F),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Total: ",
                                      style: TextStyle(
                                        color: Color(0xff373D3F),
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "2000",
                                      style: TextStyle(
                                        color: Color(0xff373D3F),
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "This year: ",
                                      style: TextStyle(
                                        color: Color(0xff373D3F),
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "140",
                                      style: TextStyle(
                                        color: Color(0xff373D3F),
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "This month: ",
                                      style: TextStyle(
                                        color: Color(0xff373D3F),
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "20",
                                      style: TextStyle(
                                        color: Color(0xff373D3F),
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1.0, // soften the shadow
                                  spreadRadius: 0, //extend the shadow
                                ),
                              ]),
                          height: height * 0.3,
                          width: width * 0.8,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Amount',
                                  style: TextStyle(
                                    color: Color(0xff373D3F),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Total: ",
                                      style: TextStyle(
                                        color: Color(0xff373D3F),
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "₹ 50,00,000",
                                      style: TextStyle(
                                        color: Color(0xff373D3F),
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "This year: ",
                                      style: TextStyle(
                                        color: Color(0xff373D3F),
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "₹ 20,55,000",
                                      style: TextStyle(
                                        color: Color(0xff373D3F),
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "This month: ",
                                      style: TextStyle(
                                        color: Color(0xff373D3F),
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "₹ 1,71,250",
                                      style: TextStyle(
                                        color: Color(0xff373D3F),
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}

import 'package:flutter/material.dart';

class Tabview extends StatefulWidget {
  @override
  _TabviewState createState() => _TabviewState();
}

class _TabviewState extends State<Tabview> {
  int visi = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1.0, // soften the shadow
                      spreadRadius: 0, //extend the shadow
                    ),
                  ]),
              height: height * 0.3,
              width: width * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Total users appointed',
                      style: TextStyle(
                        color: Color(0xff373D3F),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "55",
                      style: TextStyle(
                        color: Color(0xff373D3F),
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Total Amount invested by users",
                      style: TextStyle(
                        color: Color(0xff373D3F),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "₹ 1,55,000",
                      style: TextStyle(
                        color: Color(0xff373D3F),
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

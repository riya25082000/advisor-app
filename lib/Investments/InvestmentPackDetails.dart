import 'package:flutter/material.dart';
import 'PacksInfo.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class InvestmentPackPage extends StatefulWidget {
  String currentUserID;
  final String packname;
  InvestmentPackPage(this.packname, {Key key, @required this.currentUserID})
      : super(key: key);
  @override
  _InvestmentPackPageState createState() =>
      _InvestmentPackPageState(currentUserID: currentUserID);
}

class _InvestmentPackPageState extends State<InvestmentPackPage> {
  String currentUserID;
  _InvestmentPackPageState({@required this.currentUserID});
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
            'INVESTMENT PACK DETAILS',
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
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Text(
                            widget.packname,
                            style: TextStyle(
                                color: Color(0xff373D3F),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: height * 0.5,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0, // soften the shadow
                                  spreadRadius: 0, //extend the shadow
                                ),
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: height * 0.4,
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Your Return Value',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff373D3F),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "₹ 2,567.13",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff373D3F),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "- ₹ 5.67",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff373D3F),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: height * 0.1,
                                color: Color(0xff63E2E0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    IntrinsicHeight(
                                      child: GestureDetector(
                                        child: Text(
                                          '1m',
                                        ),
                                      ),
                                    ),
                                    VerticalDivider(
                                      width: 2,
                                    ),
                                    IntrinsicHeight(
                                        child:
                                            GestureDetector(child: Text('3m'))),
                                    VerticalDivider(
                                      width: 2,
                                    ),
                                    IntrinsicHeight(
                                        child:
                                            GestureDetector(child: Text('1y'))),
                                    VerticalDivider(
                                      width: 2,
                                    ),
                                    IntrinsicHeight(
                                        child:
                                            GestureDetector(child: Text('5y'))),
                                    VerticalDivider(
                                      width: 2,
                                    ),
                                    IntrinsicHeight(
                                        child: GestureDetector(
                                            child: Text('max'))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: height * 0.5,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0, // soften the shadow
                                  spreadRadius: 0, //extend the shadow
                                ),
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: height * 0.4,
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "Funds in this pack",
                                          style: TextStyle(
                                              color: Color(0xff373D3F),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          height: height * 0.4,
                                          child: ListView.builder(
                                              physics: ScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              itemCount: FundsInfo.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Column(
                                                  children: <Widget>[
                                                    Container(
                                                      height: height < 640
                                                          ? height * 0.3
                                                          : height * 0.22,
                                                      child: Column(
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                  FundsInfo[
                                                                          index]
                                                                      .fundName,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xff373D3F),
                                                                    fontSize:
                                                                        16,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 8,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: <
                                                                      Widget>[
                                                                    GestureDetector(
                                                                        onTap:
                                                                            () {},
                                                                        child: Icon(
                                                                            Icons.arrow_forward_ios)),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: <
                                                                      Widget>[
                                                                    Column(
                                                                      children: <
                                                                          Widget>[
                                                                        Text(
                                                                          "Min. Invest",
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Color(0xff373D3F),
                                                                            fontSize:
                                                                                14,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          FundsInfo[index]
                                                                              .minInvest,
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Color(0xff373D3F),
                                                                            fontSize:
                                                                                14,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      children: <
                                                                          Widget>[
                                                                        Text(
                                                                          "Allocation",
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Color(0xff373D3F),
                                                                            fontSize:
                                                                                14,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                            "${FundsInfo[index].allocate}%")
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      children: <
                                                                          Widget>[
                                                                        Text(
                                                                          "Returns",
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Color(0xff373D3F),
                                                                            fontSize:
                                                                                14,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          FundsInfo[index]
                                                                              .output,
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Color(0xff373D3F),
                                                                            fontSize:
                                                                                14,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          LinearPercentIndicator(
                                                            lineHeight: 16.0,
                                                            percent: double.parse(
                                                                    FundsInfo[
                                                                            index]
                                                                        .allocate) /
                                                                100,
                                                            center: Text(
                                                                "${FundsInfo[index].allocate}%"),
                                                            backgroundColor:
                                                                Colors.grey,
                                                            progressColor:
                                                                Color(
                                                                    0xff63E2E0),
                                                          ),
                                                          Divider(
                                                            color: Colors.grey,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: height * 0.1,
                                color: Color(0xff63E2E0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    IntrinsicHeight(
                                        child:
                                            GestureDetector(child: Text('1m'))),
                                    VerticalDivider(
                                      width: 2,
                                    ),
                                    IntrinsicHeight(
                                        child:
                                            GestureDetector(child: Text('3m'))),
                                    VerticalDivider(
                                      width: 2,
                                    ),
                                    IntrinsicHeight(
                                        child:
                                            GestureDetector(child: Text('1y'))),
                                    VerticalDivider(
                                      width: 2,
                                    ),
                                    IntrinsicHeight(
                                        child:
                                            GestureDetector(child: Text('5y'))),
                                    VerticalDivider(
                                      width: 2,
                                    ),
                                    IntrinsicHeight(
                                        child: GestureDetector(
                                            child: Text('max'))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}

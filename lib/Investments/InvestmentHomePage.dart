import 'package:flutter/material.dart';
import 'Code_widgets.dart';
import 'InvestmentPacks.dart';

class InvestmentHomePage extends StatefulWidget {
  String currentUserID;
  InvestmentHomePage({@required this.currentUserID});
  @override
  _InvestmentHomePageState createState() => _InvestmentHomePageState(currentUserID: currentUserID);
}

class _InvestmentHomePageState extends State<InvestmentHomePage> {
  String currentUserID;
  _InvestmentHomePageState({@required this.currentUserID});
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
          'INVESTMENT',
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      InvestmentPack(currentUserID: currentUserID,)));
                        },
                        child: investmentbuttons(
                            "assets/images/bundles.jpg",
                            "Investment Bundles",
                            "Find the right mutual funds for you across these categories",
                            height),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: investmentbuttons(
                            "assets/images/equity.png",
                            "Equity",
                            "Find the right mutual funds for you across these categories",
                            height),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: investmentbuttons(
                            "assets/images/debt.png",
                            "Debt",
                            "Find the right mutual funds for you across these categories",
                            height),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: investmentbuttons(
                            "assets/images/gold.jpg",
                            "Gold Fund",
                            "Find the right mutual funds for you across these categories",
                            height),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: investmentbuttons(
                            "assets/images/hybrid.jpg",
                            "Hybrid",
                            "Find the right mutual funds for you across these categories",
                            height),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: investmentbuttons(
                            "assets/images/tax.png",
                            "Tax Saving Fund",
                            "Find the right mutual funds for you across these categories",
                            height),
                      ),
                      Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

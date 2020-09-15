import 'package:flutter/material.dart';
import 'BottomBar.dart';

class InvestmentPack extends StatefulWidget {
  String currentUserID;
  InvestmentPack({@required this.currentUserID});
  @override
  _InvestmentPackState createState() =>
      _InvestmentPackState(currentUserID: currentUserID);
}

class _InvestmentPackState extends State<InvestmentPack> {
  String currentUserID;
  _InvestmentPackState({@required this.currentUserID});
  int current = 0;
  final List<Widget> bodyopt = [Recommend(), AllPacks()];
  void changes(int index) {
    setState(() {
      current = index;
    });
  }

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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff63E2E0),
        currentIndex: current,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        onTap: changes,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text("Recommended for you"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text("All Investment Packs"),
          )
        ],
      ),
      body: bodyopt[current],
    );
  }
}

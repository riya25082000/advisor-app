import 'package:advisorapplication/AdvisorProfilePage.dart';
import 'package:advisorapplication/Insurance/InsuranceHomePage.dart';
import 'package:advisorapplication/Investments/InvestmentHomePage.dart';
import 'package:advisorapplication/Learning/LearningHomePage.dart';
import 'package:advisorapplication/NewsLetter/NewsLetter.dart';
import 'package:advisorapplication/SearchUser.dart';
import 'package:flutter/material.dart';

import 'Support/Support.dart';
import 'WorkingSearchUser.dart';

class AdvisorMenu extends StatefulWidget {
  @override
  _AdvisorMenuState createState() => _AdvisorMenuState();
}

class _AdvisorMenuState extends State<AdvisorMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff63E2E0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Advisor',
                  style: TextStyle(
                    color: Color(0xff373D3F),
                    fontSize: 20,
                  ),
                ),
                Text(
                  '023SDE',
                  style: TextStyle(
                    color: Color(0xff373D3F),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AdvisorProfile()));
            },
          ),
          ListTile(
            title: Text('Investments'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => InvestmentHomePage()));
            },
          ),
          ListTile(
            title: Text('Insurance Products'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => InsuranceHomePage()));
            },
          ),
          ListTile(
            title: Text('Learning'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LearningHomePage()));
            },
          ),
          ListTile(
            title: Text('News Letter'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => NewsLetter()));
            },
          ),
          ListTile(
            title: Text('Search User Details'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SearchUserPage()));
            },
          ),
          ListTile(
            title: Text('Help & Support'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Support()));
            },
          ),
        ],
      ),
    );
  }
}

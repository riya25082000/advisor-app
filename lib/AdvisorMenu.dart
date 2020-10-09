import 'package:advisorapplication/AdvisorProfilePage.dart';
import 'package:advisorapplication/Insurance/InsuranceHomePage.dart';
import 'package:advisorapplication/Investments/InvestmentHomePage.dart';
import 'package:advisorapplication/Learning/LearningHomePage.dart';
import 'package:advisorapplication/LoginSignUp/AdvisorLogin.dart';
import 'package:advisorapplication/NewsLetter/NewsLetter.dart';
import 'package:advisorapplication/SearchUser.dart';
import 'package:advisorapplication/Security/SecurityMenu.dart';
import 'package:advisorapplication/WorkingSearchUser.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Support/Support.dart';

import 'WorkingSearchUser.dart';

import 'Security/changePassword.dart';

class AdvisorMenu extends StatefulWidget {
  String currentAdvisorID;
  AdvisorMenu({@required this.currentAdvisorID});
  @override
  _AdvisorMenuState createState() =>
      _AdvisorMenuState(currentAdvisorID: currentAdvisorID);
}

class _AdvisorMenuState extends State<AdvisorMenu> {
  String currentAdvisorID;
  _AdvisorMenuState({@required this.currentAdvisorID});
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
                  "023SDE",
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
                      builder: (BuildContext context) => AdvisorProfile(
                            currentAdvisorID: currentAdvisorID,
                          )));
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
                      builder: (BuildContext context) => SearchUserPage(
                            currentAdvisorID: currentAdvisorID,
                          )));
            },
          ),
          ListTile(
            title: Text('Help & Support'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Support(currentAdvisorID: currentAdvisorID,)));
            },
          ),
          ListTile(
            title: Text('Security Controls'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SecurityMenu(
                            currentAdvisorID: currentAdvisorID,
                          )));
            },
          ),
          ListTile(
            title: Text('Sign Out'),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('advisorid');
              Navigator.of(context).pushAndRemoveUntil(
                // the new route
                MaterialPageRoute(
                  builder: (BuildContext context) => AdvisorLogin(),
                ),

                // this function should return true when we're done removing routes
                // but because we want to remove all other screens, we make it
                // always return false
                (Route route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}

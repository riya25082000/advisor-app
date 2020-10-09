import 'package:advisorapplication/NewAdvisorHomePage.dart';
import 'package:advisorapplication/SetPin.dart';
import 'package:advisorapplication/WorkingSearchUser.dart';
import 'package:advisorapplication/disableTouchid.dart';
import 'package:advisorapplication/mPInPage.dart';
import 'package:advisorapplication/mpinChange.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AdvisorHomePage.dart';
import 'LoginSignUp/AdvisorLogin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var aid = prefs.getString('advisorid');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: aid == null
        ? AdvisorLogin()

        : PassCodeScreen(
            currentAdvisorID: aid,
          ),
  ));
}

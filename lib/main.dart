import 'package:advisorapplication/NewAdvisorHomePage.dart';
import 'package:advisorapplication/LoginSignUp/AdvisorLogin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var aid = prefs.getString('advisorid');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: aid == null
        ? AdvisorLogin()
        : AdvisorHomePage(
            currentAdvisorID: aid,
          ),
  ));
}

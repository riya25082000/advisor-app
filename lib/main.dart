import 'package:advisorapplication/AdvisorHomePage.dart';
import 'package:advisorapplication/LoginSignUp/AdvisorLogin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  runApp(MaterialApp(
    home: email == null
        ? AdvisorLogin()
        : AdvisorHomePage(
            currentAdvisorID: '1234',
          ),
  ));
}

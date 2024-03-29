import 'package:advisorapplication/AdvisorHomePage.dart';
import 'package:advisorapplication/NewAdvisorHomePage.dart';
import 'package:flutter/material.dart';



Widget alertinternet(BuildContext context, String currentUserID) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Internet Error"),
        content: Text(
            "There seems to be an issue with your internet connection. Please check."),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AdvisorHomePage1()));
            },
            child: Text("Ok"),
          )
        ],
      );
    },
  );
}

Widget alerttimeout(BuildContext context, String currentUserID) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          children: [
            Icon(Icons.error),
            Text("Timeout Error"),
          ],
        ),
        content: Text(
            "The data is taking taking too long to load. Please try again later."),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AdvisorHomePage(
                        // currentUserID: currentUserID,
                      )));
            },
            child: Text("Ok"),
          )
        ],
      );
    },
  );
}

Widget alerterror(BuildContext context, String currentUserID) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Error"),
        content: Text("There seems to be an error.Please try again later."),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AdvisorHomePage1()));
            },
            child: Text("Ok"),
          )
        ],
      );
    },
  );
}

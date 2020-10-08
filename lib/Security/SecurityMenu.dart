import 'package:advisorapplication/mpinChange.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../disableTouchid.dart';
import 'changePassword.dart';

class SecurityMenu extends StatefulWidget {
  String currentAdvisorID;
  SecurityMenu({@required this.currentAdvisorID});
  @override
  _SecurityMenuState createState() =>
      _SecurityMenuState(currentAdvisorID: currentAdvisorID);
}

class _SecurityMenuState extends State<SecurityMenu> {
  String currentAdvisorID;
  _SecurityMenuState({@required this.currentAdvisorID});
  Widget option(double height, double width, String title, String content) {
    return Container(
      height: height * 0.1,
      width: width,
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              content,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
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
          'SECURITY CONTROLS',
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    DisableTouchID(
                                      currentAdvisorID: currentAdvisorID,
                                    )));
                      },
                      child: option(
                          height, width, "Touch ID", "Enable/Disable TouchID"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ChangeMpin(
                                      currentAdvisorID: currentAdvisorID,
                                    )));

                      },
                      child: option(
                          height, width, "Change Mpin", "Reset your Mpin"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ChangePassword(
                                      currentAdvisorID: currentAdvisorID,
                                    )));
                      },
                      child: option(height, width, "Change Password",
                          "Reset your account password"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

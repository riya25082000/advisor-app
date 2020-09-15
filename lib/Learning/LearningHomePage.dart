import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'Introduction.dart';
import 'ModuleCode.dart';

class LearningHomePage extends StatefulWidget {
  String currentUserID;
  LearningHomePage({@required this.currentUserID});
  @override
  _LearningHomePageState createState() => _LearningHomePageState(currentUserID: currentUserID);
}

class _LearningHomePageState extends State<LearningHomePage> {
  String currentUserID;
  _LearningHomePageState({@required this.currentUserID});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
          'LEARNING',
          style: TextStyle(color: Color(0xff373D3F)),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Let's start learning",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff373D3F),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: height < 640 ? height * 0.3 : height * 0.25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 1.0, // soften the shadow
                            spreadRadius: 0, //extend the shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Module 1",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff373D3F),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Stock Market Basics",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xff373D3F),
                                ),
                              ),
                            ),
                            Text(
                              "Level: Beginner",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff373D3F),
                              ),
                            ),
                            Text(
                              "Chapter: 1",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff373D3F),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Progress",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff373D3F),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            LinearPercentIndicator(
                              lineHeight: 10.0,
                              percent: 0.3,
                              backgroundColor: Color(0xffC8E6C9),
                              progressColor: Color(0xff2BD26E),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Other Modules",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff373D3F),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: height * 0.5,
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 40.0,
                          mainAxisSpacing: 40.0,
                          physics: NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Introduction("1",currentUserID: currentUserID,)));
                              },
                              child: modules(width, height, Color(0xff48F5D9),
                                  Color(0xff17AD94), 1),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Introduction("2",currentUserID: currentUserID,)));
                              },
                              child: modules(width, height, Color(0xffB370FF),
                                  Color(0xff9E49FF), 2),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Introduction("3",currentUserID: currentUserID,)));
                              },
                              child: modules(width, height, Color(0xffFFFAB40),
                                  Color(0xffFF9340), 3),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Introduction("4",currentUserID: currentUserID,)));
                              },
                              child: modules(width, height, Color(0xff6BC412),
                                  Color(0xff5BB600), 4),
                            ),
                          ],
                        ),
                      ),
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

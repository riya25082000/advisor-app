import 'package:advisorapplication/Income_Expenses/income2.dart';
import 'package:advisorapplication/UserPages/Learning/LearningHomePage.dart';
import 'package:advisorapplication/UserPages/NewsLetter/NewsLetter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'UserPages/MyGoals/NewGoalsHomePage.dart';
import 'UserPages/RewardsandRefer/newRefer.dart';
import 'WorkingSearchUser.dart';

class UserInfo extends StatefulWidget {
  String currentUserID, currentAdvisorID;
  UserInfo({@required this.currentUserID, @required this.currentAdvisorID});
  @override
  _UserInfoState createState() => _UserInfoState(
      currentUserID: currentUserID, currentAdvisorID: currentAdvisorID);
}

class _UserInfoState extends State<UserInfo> {
  String currentUserID, currentAdvisorID;
  _UserInfoState(
      {@required this.currentUserID, @required this.currentAdvisorID});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Future.delayed(Duration.zero, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SearchUserPage(
                            currentAdvisorID: currentAdvisorID,
                          )));
            });
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xff373D3F),
        ),
        backgroundColor: Color(0xff63E2E0),
        centerTitle: true,
        title: Text(
          'USER DATA',
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
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => NewGoalsPage(
                                    currentUserID: currentUserID,
                                  )));
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.golf_course),
                          Text('Goals'),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => income2(
                                    currentUserID: currentUserID,
                                  )));
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.attach_money),
                          Text('Income & Expenses'),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LearningHomePage(
                                    currentUserID: currentUserID,
                                  )));
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.library_books),
                          Text('Learning'),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => RewardandRefer(
                                    currentUserID: currentUserID,
                                  )));
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.card_giftcard),
                          Text('Rewards & Referrals'),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => NewsLetter(
                                    currentUserID: currentUserID,
                                  )));
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.card_giftcard),
                          Text('News Letter'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

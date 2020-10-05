import 'package:advisorapplication/Support/Support.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class showQuestion extends StatefulWidget {
  String currentUserID;
  String cate;
  int suid;
  showQuestion(this.cate, this.suid, {@required this.currentUserID});
  @override
  _showQuestionState createState() =>
      _showQuestionState(currentUserID: currentUserID);
}

class _showQuestionState extends State<showQuestion> {
  List quesuser = [], quesadvisor = [];
  void getQuesUser() async {
    print(widget.suid.toString());
    var url =
        'http://sanjayagarwal.in/Finance App/UserApp/Support/SupportQuestion.php';
    final response = await http.post(
      url,
      body: jsonEncode(<String, String>{
        'sid': widget.suid.toString(),
      }),
    );
    var message = await jsonDecode(response.body);
    print("****************************************");
    print(message);
    print("****************************************");
    setState(() {
      quesuser = message;
    });
  }

  void getQuesAdvisor() async {
    print(widget.suid.toString());
    var url =
        'http://sanjayagarwal.in/Finance App/AdvisorApp/Support/SupportQuestionAdvisor.php';
    final response = await http.post(
      url,
      body: jsonEncode(<String, String>{
        'sid': widget.suid.toString(),
      }),
    );
    var message = await jsonDecode(response.body);
    print("****************************************");
    print(message);
    print("****************************************");
    setState(() {
      quesadvisor = message;
    });
  }

  @override
  void initState() {
    print("****************************************");
    print(currentUserID);
    print("****************************************");
    getQuesUser();
    getQuesAdvisor();
    // TODO: implement initState
    super.initState();
  }

  Widget QandA(List data) {
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (BuildContext cntx, int index) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.purple,
                width: 2.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(data[index]["question"]),
                  Text(data[index]["answer"])
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String currentUserID;
  _showQuestionState({@required this.currentUserID});

  int question = 0;
  void changes(int index) {
    setState(() {
      question = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List questionbody = [QandA(quesuser), QandA(quesadvisor)];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff63E2E0),
        currentIndex: question,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        onTap: changes,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("User"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_contact_calendar),
            title: Text("Advisor"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              height: height * 0.15,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/app.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: IconButton(
                        onPressed: () {
                         // Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Support()));
                        },
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      widget.cate,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            questionbody[question],
          ],
        ),
      ),
    );
  }
}

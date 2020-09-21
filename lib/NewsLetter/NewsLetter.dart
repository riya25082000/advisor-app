import 'package:flutter/material.dart';
import 'ShowLetter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsLetter extends StatefulWidget {
  @override
  _NewsLetterState createState() => _NewsLetterState();
}

class _NewsLetterState extends State<NewsLetter> {
  int x;
  TextEditingController newletter = TextEditingController();
  TextEditingController newurl = TextEditingController();
  TextEditingController existnews = TextEditingController();
  TextEditingController existurl = TextEditingController();

  List letteruse = [];
  void getLetterUser() async {
    var url =
        'http://sanjayagarwal.in/Finance App/UserApp/NewsLetter/NewsLetterDetails.php';
    final response = await http.post(
      url,
      body: jsonEncode(<String, String>{}),
    );
    var message = await jsonDecode(response.body);
    print("****************************************");
    print(message);
    print("****************************************");
    setState(() {
      letteruse = message;
    });
  }

  List letteradvi = [];
  void getLetterAdvisor() async {
    var url =
        'http://sanjayagarwal.in/Finance App/AdvisorApp/NewsLetter/NewsLetterDetailsAdvisor.php';
    final response = await http.post(
      url,
      body: jsonEncode(<String, String>{}),
    );
    var message = await jsonDecode(response.body);
    print("****************************************");
    print(message);
    print("****************************************");
    setState(() {
      letteradvi = message;
    });
  }

  @override
  void initState() {
    print("****************************************");
    print("****************************************");
    getLetterUser();
    getLetterAdvisor();
    // TODO: implement initState
    super.initState();
  }

  int c = 0;
  void changes(int index) {
    setState(() {
      c = index;
    });
  }

  Widget letterbody(List data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        physics: ScrollPhysics(),
        children: List.generate(data.length, (index) {
          return GestureDetector(
            onTap: () {
              print(data[index]['nurl']);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ShowLetter(
                            int.parse(data[index]['nid']),
                            data[index]['ntitle'],
                            data[index]['nurl'],
                          )));
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff48F5D9), Colors.white]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      data[index]['ntitle'],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List newsletterbody = [letterbody(letteruse), letterbody(letteradvi)];
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
          'NEWS LETTER',
          style: TextStyle(color: Color(0xff373D3F)),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff63E2E0),
        currentIndex: c,
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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          c == 0 ? 'User News Letter' : 'Advisor News Letter',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff373D3F),
                          ),
                        ),
                      ],
                    ),
                    newsletterbody[c],
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

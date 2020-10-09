import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../NewAdvisorHomePage.dart';
import 'showQuestion.dart';

class Support extends StatefulWidget {
  String currentAdvisorID;
  Support({@required this.currentAdvisorID});
  @override
  _SupportState createState() => _SupportState(currentAdvisorID: currentAdvisorID);
}
int supp = 0;
class _SupportState extends State<Support> {
  String currentAdvisorID;
  _SupportState({@required this.currentAdvisorID});

  List advisorcategory = [], usercategory = [];
  List searchList = [],searchList1 = [];
  List ques = [], supcategory = [], supcategory1 = [];
  var url;

  Future userSearchData() async {

      url =
          'http://sanjayagarwal.in/Finance App/UserApp/Support/userCategoryData.php';



    final response = await http.post(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      for (var i = 0; i < jsonData.length; i++) {
        searchList.add(jsonData[i]['sname']);
        // searchList.add(jsonData[i]['sid']);
      }
    }

    // print(searchList);

    var message2 = await jsonDecode(response.body);
    // print("****************************************");
    // print(message2);
    // print("****************************************");

    setState(() {
      supcategory = message2;
      //print(supcategory[0]["sid"]);
    });
  }

  Future userCategoryData() async {

      url =
      'http://sanjayagarwal.in/Finance App/UserApp/Support/advisorCategory.php';

    final response = await http.post(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      for (var i = 0; i < jsonData.length; i++) {
        searchList1.add(jsonData[i]['sname']);
        // searchList.add(jsonData[i]['sid']);
      }
    }

    // print(searchList);

    var message2 = await jsonDecode(response.body);
    // print("****************************************");
    // print(message2);
    // print("****************************************");

    setState(() {
      supcategory = message2;
      //print(supcategory[0]["sid"]);
    });
  }

  void getCategoryUser() async {
    var url2 =
        'http://sanjayagarwal.in/Finance App/UserApp/Support/SupportCategory.php';
    final response2 = await http.post(
      url2,
      body: jsonEncode(<String, String>{
        "UserID": currentAdvisorID,
      }),
    );
    var message2 = await jsonDecode(response2.body);
    // print("****************************************");
    // print(message2);
    // print("****************************************");
    setState(() {
      usercategory = message2;
    });
  }

  void getCategoryAdvisor() async {
    var url2 =
        'http://sanjayagarwal.in/Finance App/AdvisorApp/Support/SupportCategoryAdvisor.php';
    final response2 = await http.post(
      url2,
      body: jsonEncode(<String, String>{
        "UserID": currentAdvisorID,
      }),
    );
    var message2 = await jsonDecode(response2.body);
    // print("****************************************");
    // print(message2);
    // print("****************************************");
    setState(() {
      advisorcategory = message2;
    });
  }

  @override
  void initState() {
    // print("****************************************");
    // print(currentAdvisorID);
    // print("****************************************");
    getCategoryUser();
    getCategoryAdvisor();
    userSearchData();
    userCategoryData();
    // TODO: implement initState
    super.initState();
  }

  Widget supportbuilder(List data) {
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (BuildContext cntx, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => showQuestion(
                          data[index]["sname"],
                          int.parse(data[index]["sid"]),
                      currentAdvisorID: currentAdvisorID,
                        )));
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xff63E2E0),
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(data[index]["sname"]),
                    Icon(
                      Icons.print,
                      size: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  TextEditingController searchques = TextEditingController();

  void changes(int index) {
    setState(() {
      supp = index;

    });
  }

  @override
  Widget build(BuildContext context) {
    List supportwindow = [
      supportbuilder(usercategory),
      supportbuilder(advisorcategory)
    ];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff63E2E0),
        currentIndex: supp,
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
              height: height * 0.2,
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
                          Navigator.of(context).pushReplacement(
                              new MaterialPageRoute(builder: (BuildContext context) {
                                return AdvisorHomePage1(
                                  currentAdvisorID: currentAdvisorID,
                                );
                              }));
                          //Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "How can we help you?",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: width * 0.6,
                          decoration: BoxDecoration(color: Colors.white),
                          child: TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: "Enter your search here",
                            ),
                            textAlign: TextAlign.center,
                            controller: searchques,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.search),
                          color: Colors.white,
                          onPressed: () {
                            if(supp==0) {
                              showSearch(
                                  context: context,
                                  delegate: UserSearch(list: searchList));
                            }
                            else if(supp==1)
                              {
                                showSearch(
                                    context: context,
                                    delegate: UserSearch(list: searchList1));
                              }
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            supportwindow[supp],
          ],
        ),
      ),
    );
  }
}

class UserSearch extends SearchDelegate<String> {
  List<dynamic> list, list2;
  var list3;
  UserSearch({this.list});

  Future userData() async {
    if (supp == 0) {
      var url =
          'http://sanjayagarwal.in/Finance App/UserApp/Support/SupportCategoryData.php';
      final response = await http.post(
        url,
        body: jsonEncode(<String, String>{
          "Name": query,
        }),
      );
      if (response.statusCode == 200) {
        List jsonData = jsonDecode(response.body);
        list3 = jsonData[0]["sid"];
        list2 = jsonData;
        // print(
        //     "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
        // print("list3");
        // print(list3);
        // print(
        //     "**********************************************************************");
        return jsonData;

      }
    }
    else if (supp==1) {
      print("supp");
      print(supp);
      var url1 = 'http://sanjayagarwal.in/Finance%20App/UserApp/Support/supportCategoryAdvisor.php';
      final response1 = await http.post(
        url1,
        body: jsonEncode(<String, String>{
          "Name": query,
        }),
      );
      if (response1.statusCode == 200) {
        List jsonData = jsonDecode(response1.body);
        list3 = jsonData[0]["sid"];
        list2 = jsonData;
        // print(
        //     "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
        // print("list3");
        // print(list3);
        // print(
        //     "**********************************************************************");
        return jsonData;
      }
    }
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: userData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                print(index);

                var list = snapshot.data[index];

                //print(list);
                // print('show');
                //     print(list["sname"]);
                //     print(int.parse(list3));
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => showQuestion(
                                list["sname"],
                                int.parse(list3),
                            currentAdvisorID: "987654321",
                              )));
                });

                return ListTile(
                  title: Text(list['sname']),
                );
              });
        }
        return CircularProgressIndicator();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var listData = query.isEmpty
        ? list
        : list.where((element) => element.contains(query)).toList();
    return listData.isEmpty
        ? Center(
            child: Text(
            'NO CATEGORY FOUND',
            style: TextStyle(fontSize: 20),
          ))
        : ListView.builder(
            itemCount: listData.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  query = listData[index];
                  showResults(context);
                },
                title: Text(listData[index]),
              );
            });
  }
}

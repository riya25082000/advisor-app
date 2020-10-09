import 'dart:convert';

import 'package:advisorapplication/NewAdvisorHomePage.dart';
import 'package:advisorapplication/UserInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'UserInfo.dart';

import 'UserInfo.dart';
import 'UserInfo.dart';
import 'UserInfo.dart';
import 'UserInfo.dart';
import 'UserInfo.dart';

class SearchUserPage extends StatefulWidget {
  final String currentAdvisorID;
  SearchUserPage({Key key, @required this.currentAdvisorID}) : super(key: key);
  @override
  _SearchUserPage createState() =>
      _SearchUserPage(currentAdvisorID: currentAdvisorID);
}
// //

class _SearchUserPage extends State<SearchUserPage> {
  String currentAdvisorID;
  _SearchUserPage({@required this.currentAdvisorID});

  List searchList = [];
  Future userSearchData() async {
    var url = 'http://sanjayagarwal.in/Finance App/SearchUser.php';
    print(currentAdvisorID);
    final response = await http.post(
      url,
      body: jsonEncode(<String, String>{"id": currentAdvisorID}),
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      for (var i = 0; i < jsonData.length; i++) {
        searchList.add(jsonData[i]['Name']);
      }

      print(searchList);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userSearchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AdvisorHomePage1(
                          currentAdvisorID: currentAdvisorID,
                        )));
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xff373D3F),
        ),
        backgroundColor: Color(0xff63E2E0),
        centerTitle: true,
        title: Text(
          'SEARCH USER',
          style: TextStyle(color: Color(0xff373D3F)),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: UserSearch(
                      list: searchList, currentAdvisorID: currentAdvisorID));
            },
            icon: Icon(Icons.search),
            color: Color(0xff373D3F),
          )
        ],
      ),
    );
  }
}

class UserSearch extends SearchDelegate<String> {
  String currentAdvisorID;
  List<dynamic> list;
  UserSearch({this.list, this.currentAdvisorID});

  Future userData() async {
    var url = 'http://sanjayagarwal.in/Finance App/userData.php';
    final response = await http.post(
      url,
      body: jsonEncode(<String, String>{"Name": query, "id": currentAdvisorID}),
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(
          "**********************************************************************");
      print(query);
      print(
          "**********************************************************************");
      return jsonData;
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
                var list = snapshot.data[index];

                SchedulerBinding.instance.addPostFrameCallback((_) {
                  // add your code here.//////////////
                  print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
                  print(index);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => UserInfo(
                                currentUserID: list['UserID'],
                                currentAdvisorID: currentAdvisorID,
                              )));
                });

                return ListTile(
                  title: Text(list['UserID']),
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
            'NO USER FOUND',
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

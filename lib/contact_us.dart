import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class Contact_us extends StatelessWidget {
  final String currentUserID;
  Contact_us({@required this.currentUserID});
  @override
  Widget build(BuildContext context) {
    return MyHomePage(currentUserID: currentUserID,);
  }
}

class MyHomePage extends StatefulWidget {
  String currentUserID;
  MyHomePage({Key key,@required this.currentUserID}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState(currentUserID: currentUserID);
}

class _MyHomePageState extends State<MyHomePage> {
  String currentUserID;
  _MyHomePageState({@required this.currentUserID});
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  Icon searchIcon = Icon(Icons.search);
  Widget appBarTitle = Text(
    'SUPPORT',
    style: TextStyle(
      color: Color(0xff373D3F),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xff373D3F),
        ),
        actions: <Widget>[
          IconButton(
            icon: searchIcon,
            onPressed: () {
              setState(() {
                if (this.searchIcon.icon == Icons.search) {
                  this.searchIcon = Icon(Icons.close);
                  this.appBarTitle = TextField(
                    style: TextStyle(),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        hintText: 'Search Question'),
                  );
                } else {
                  this.searchIcon = Icon(Icons.search);
                  this.appBarTitle = Text(
                    'SUPPORT',
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Color(0xff373D3F),
                    ),
                  );
                }
              });
            },
            color: Colors.black,
          ),
        ],
        backgroundColor: Color(0xff63E2E0),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: appBarTitle,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 15,
            itemBuilder: (BuildContext cntx, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  children: <Widget>[
                    ExpansionTileCard(
                      title: Text('1. Question 1'),
                      children: <Widget>[
                        Divider(
                          thickness: 0.8,
                          height: 1.0,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40.0,
                              vertical: 8.0,
                            ),
                            child: Text(
                              'Answer 1',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 0.4,
                      height: 1.0,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

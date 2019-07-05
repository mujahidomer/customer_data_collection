import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_collection/customer/customer.dart';
import 'package:data_collection/customer/n_customer_screen.dart';
import 'package:data_collection/profile_page.dart';
//import 'package:data_collection/customer/customer_screen.dart';
import 'package:data_collection/tab1_homepage_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/user_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainHomePage(),
    );
  }
}

class MainHomePage extends StatefulWidget {

  const MainHomePage({Key key}) : super(key: key);
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 16.0,
            right: 16.0,
            top: 16,
            child: Container(
              height: deviceHeight / 5.1,
              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          Positioned(
            left: 24.0,
            right: 24.0,
            top: 24.0,
            child: Container(
              height: deviceHeight / 5.1,
              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(top: 52.0, right: 16.0, left: 16.0),
              height: deviceHeight / 5,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.search),
                        iconSize: 32.0,
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      Text(
                        'Your Collection',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2.0,
                          fontSize: 25.0,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert),
                        iconSize: 32.0,
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  TabBar(
                    unselectedLabelColor: Colors.white,
                    labelColor: Colors.greenAccent,
                    labelStyle: TextStyle(
                      fontFamily: 'Gilroy',
                      letterSpacing: 1.0,
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,
                    indicatorColor: Colors.greenAccent,
                    controller: _tabController,
                    tabs: <Widget>[
                      Tab(
                        text: "HOME",
                      ),
                      Tab(
                        text: "OTHER",
                      ),
                      Tab(
                        text: "PROFILE",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: deviceHeight / 4.4,
            left: 0,
            right: 0,
            child: Container(
              height: deviceHeight / 1.3,
              color: Colors.grey,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                    Container(
                      child: HomePageView(),
                      color: Colors.white,
                    ),
                  Container(
                    color: Colors.blue,
                  ),
                  Container(
                    child: ProfilePage(),
                    color: Colors.red,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

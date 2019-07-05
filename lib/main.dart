import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_collection/Authentication/register_page.dart';
import 'package:data_collection/customer/customer.dart';
import 'package:data_collection/Authentication/login_page.dart';
import 'package:data_collection/main_home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:data_collection/model/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:data_collection/customer/n_customer_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder> {
        '/homePage': (BuildContext context) => new MyApp(),
        '/register': (BuildContext context) => new RegisterPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => UserRepository.instance(),
      child: Consumer(
        builder: (context, UserRepository user, _) {
          switch (user.status) {
            case Status.Uninitialized:
              return Splash();
            case Status.Unauthenticated:
            case Status.Authenticating:
              //return RegisterPage();
              return LoginPage();
            case Status.Authenticated:
              //return CustomerScreen(Customer('', '', '', '', ''));
              //return UserInfoPage(user: user.user);
              return MainHomePage();
          }
        },
      ),
    );
  }
}

/*class UserInfoPage extends StatelessWidget {
  final FirebaseUser user;
  final FirebaseAuth uid;

  const UserInfoPage({Key key, this.user, this.uid}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
              stream: Firestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  const Text('No data available');
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot myUsers =
                            snapshot.data.documents[index];
                        return Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 100.0,
                                  padding:
                                      EdgeInsets.only(top: 8.0, bottom: 8.0),
                                  child: Material(
                                    color: Colors.white,
                                    elevation: 14.0,
                                    shadowColor: Color(0x802196F3),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '${myUsers['Name']}',
                                              style: TextStyle(
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              '${myUsers['Total']}',
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.blueGrey,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              //color: Colors.grey,
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .09,
                                left: MediaQuery.of(context).size.height * .02,
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar (
                                      backgroundColor: Color(0xff54387A),
                                      child: Icon(Icons.star, color: Colors.white, size: 20.0,),
                                    ),
                                    SizedBox(width: 60.0,),
                                    RaisedButton(
                                      child: Text("SIGN OUT"),
                                      onPressed: () => Provider.of<UserRepository>(context).signOut(),
                                    ),
                                    SizedBox(width: 40.0,),
                                    RaisedButton(
                                      child: Text("NEW ENTRY"),
                                       onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>
                                              CustomerScreen(Customer('', '', '', '', '')),
                                              fullscreenDialog: true),
                                          );
                                        },
                                      //onPressed: () => Provider.of<UserRepository>(context).signOut(),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      });
                }
                /* Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(user.email),
                          RaisedButton(
                            child: Text("SIGN OUT"),
                            onPressed: () => Provider.of<UserRepository>(context).signOut(),
                          )
                        ],
                      ),
                    ); */
              }),
        ),
      ),
    );
  }
} */

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}

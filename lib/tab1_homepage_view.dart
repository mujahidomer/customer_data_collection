import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_collection/customer/customer.dart';
import 'package:data_collection/customer/n_customer_screen.dart';
import 'package:data_collection/model/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
          stream: Firestore.instance.collection('\Users').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              const Text('No data available');
            } else {
              return ListView.builder(
                scrollDirection: Axis.vertical,
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
                                          '${myUsers['email']}',
                                          style: TextStyle(
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          '${myUsers['uid']}',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.blueGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30.0,),
                            /*Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(user.uid, style: TextStyle(fontWeight: FontWeight.bold),),
                                            ],
                                          ), */
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
                                          NCustomerScreen(Customer('', '', '', '', '')),
                                          fullscreenDialog: true),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            }
          }),
    );
  }
}

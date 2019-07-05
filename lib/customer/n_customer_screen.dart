import 'package:data_collection/customer/customer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_collection/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NCustomerScreen extends StatefulWidget {
  final Customer customer;

  NCustomerScreen(this.customer);
  @override
  _NCustomerScreenState createState() => _NCustomerScreenState();
}

class _NCustomerScreenState extends State<NCustomerScreen> {
FirestoreServices fireServ = new FirestoreServices();

FirebaseAuth auth;


/*Future<String> inputData() async {
  final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  final String uid = user.uid.toString();
  return uid;
} */

TextEditingController _custNameController;
TextEditingController _custDetailsController;
TextEditingController _custDateController;
TextEditingController _custTimeController;

int _custType = 0;
String taskVal;
void _handleTaskType(int value) {
  setState(() {
    _custType = value;
    switch (_custType) {
      case 1:
        taskVal = 'travel';
        break;
      case 2:
        taskVal = 'shopping';
        break;
      case 3:
        taskVal = 'gym';
        break;
      case 4:
        taskVal = 'party';
        break;
      case 5:
        taskVal = 'others';
        break;
    }
  });
}

@override
void initState() {
  super.initState();

  _custNameController =
  new TextEditingController(text: widget.customer.custName);
  _custDetailsController =
  new TextEditingController(text: widget.customer.custDetails);
  _custDateController =
  new TextEditingController(text: widget.customer.custDate);
  _custTimeController =
  new TextEditingController(text: widget.customer.custTime);
}


@override
Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 14.0,
            right: 14.0,
            top: 16.0,
            child: Container(
              height: deviceHeight / 7.1,
              decoration: BoxDecoration(
                color: Colors.grey[800].withOpacity(0.5),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          Positioned(
            left: 24.0,
            right: 24.0,
            top: 24.0,
            child: Container(
              height: deviceHeight / 7.1,
              decoration: BoxDecoration(
                color: Colors.grey[800].withOpacity(0.2),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(top: 48.0, right: 16.0, left: 16.0),
              height: deviceHeight / 7,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.cancel),
                        iconSize: 32.0,
                        color: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(width: 40.0,),
                      Text(
                        'Add New Customer',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0,
                          fontSize: 25.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ), // END OF LAST POSITIONED
          Positioned(
            top: deviceHeight / 6,
            left: 0,
            right: 0,
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 26.0, right: 26.0),
                        child: TextField(
                          controller: _custNameController,
                          decoration: InputDecoration(labelText: "Name: "),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 26.0, right: 26.0),
                        child: TextField(
                          controller: _custDetailsController,
                          decoration: InputDecoration(labelText: "Details: "),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 26.0, right: 26.0),
                        child: TextField(
                          controller: _custDateController,
                          decoration: InputDecoration(labelText: "Date: "),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 26.0, right: 26.0),
                        child: TextField(
                          controller: _custTimeController,
                          decoration: InputDecoration(labelText: "Time: "),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Center(
                        child: Text(
                          'Select Task Type:',
                          style:
                          TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26.0, right: 26.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Radio(
                                  value: 1,
                                  groupValue: _custType,
                                  onChanged: _handleTaskType,
                                  activeColor: Color(0xff4158ba),
                                ),
                                Text(
                                  'Travel',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Radio(
                                  value: 2,
                                  groupValue: _custType,
                                  onChanged: _handleTaskType,
                                  activeColor: Color(0xfffb537f),
                                ),
                                Text(
                                  'Shopping',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Radio(
                                  value: 3,
                                  groupValue: _custType,
                                  onChanged: _handleTaskType,
                                  activeColor: Color(0xff4caf50),
                                ),
                                Text(
                                  'Gym',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Radio(
                                  value: 4,
                                  groupValue: _custType,
                                  onChanged: _handleTaskType,
                                  activeColor: Color(0xff9962d0),
                                ),
                                Text(
                                  'Party',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Radio(
                                  value: 5,
                                  groupValue: _custType,
                                  onChanged: _handleTaskType,
                                  activeColor: Color(0xff0dc8f5),
                                ),
                                Text(
                                  'Others',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                              color: Color(0xFFFA7397),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: Color(0xFFFDDE42)),
                              )),
                          // This button results in adding the contact to the database
                          RaisedButton(
                              color: Color(0xFFFA7397),
                              onPressed: () {
                                /*Map UID = {
                                  'userID': this.inputData(),
                                };
                                Firestore.instance.collection('customers').add(UID); */
                                fireServ
                                    .createCustomer(
                                    _custNameController.text,
                                    _custDetailsController.text,
                                    _custDateController.text,
                                    _custTimeController.text,
                                    taskVal)
                                    .then((_) {
                                  Navigator.pop(context);
                                });
                              },
                              child: const Text(
                                "Submit",
                                style: TextStyle(color: Color(0xFFFDDE42)),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),  // END OF STACK

    );
  }
}
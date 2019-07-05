import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 350.0,
                width: double.infinity,
              ),
              Positioned(
                top: 75.0,
                left: 15.0,
                right: 15.0,
                child: Material(
                  elevation: 6.0,
                  borderRadius: BorderRadius.circular(7.0),
                  child: Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0.0,
                left: (MediaQuery.of(context).size.width / 2 - 60.0),
                child: Container(
                  height: 130.0,
                  width: 130.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: AssetImage('assets/images/profile.PNG'),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
              )
            ],
          )
        ],
      ),

    );
  }
}

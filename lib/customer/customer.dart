import 'package:firebase_auth/firebase_auth.dart';

class Customer{
  String _custName;
  String _custDetails;
  String _custDate;
  String _custTime;
  String _custType;
  //Future<String> _custPromo;

  Customer(this._custName, this._custDetails, this._custDate, this._custTime, this._custType);

  Customer.map(dynamic obj) {
    this._custName = obj['custName'];
    this._custDetails = obj['custDetails'];
    this._custDate = obj['custDate'];
    this._custTime = obj['custTime'];
    this._custType = obj['custType'];
    //this._custPromo = obj['custPromo'];
  }

  String get custName => _custName;
  String get custDetails => _custDetails;
  String get custDate => _custDate;
  String get custTime => _custTime;
  String get custType => _custType;
  //Future<String> get custPromo => _custPromo;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['custName'] = _custName;
    map['custDetails'] = _custDetails;
    map['custDate'] = _custDate;
    map['custTime'] = _custTime;
    map['custType'] = _custType;
    //map['custPromo'] = _custPromo;
    return map;
  }

  Customer.fromMap(Map<String, dynamic> map) {
    this._custName = map['custName'];
    this._custDetails = map['custDetails'];
    this._custDate = map['custDate'];
    this._custTime = map['custTime'];
    this._custType = map['custType'];
    //this._custPromo = map['custPromo'];
  }

}
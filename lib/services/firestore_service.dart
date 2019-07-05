import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_collection/customer/customer.dart';
import 'package:firebase_auth/firebase_auth.dart';

final CollectionReference myCustomerCollection = Firestore.instance.collection('customers');

class FirestoreServices {
  Future<Customer> createCustomer(String custName, String custDetails, String custDate, String custTime, String custType) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(myCustomerCollection.document());

      final Customer customer = Customer(custName, custDetails, custDate, custTime, custType);
      final Map<String, dynamic> data = customer.toMap();
      await tx.set(ds.reference, data);
      return data;
    };

    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return Customer.fromMap(mapData);
    }).catchError((onError) {
      print('error:$onError');
      return null;

    });
  }

  Stream<QuerySnapshot> getCustomerList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = myCustomerCollection.snapshots();
    if(offset != null) {
      snapshots = snapshots.skip(offset);
    }
    if(limit != null) {
      snapshots = snapshots.take(limit);
    }
  }
}
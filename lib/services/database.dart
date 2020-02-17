import 'package:syndik_app/models/apt.dart';
import 'package:syndik_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });
//  final FirebaseAuth _auth = FirebaseAuth.instance;

  // collection reference
  final CollectionReference aptCollection = Firestore.instance.collection('apts');

  Future<void> updateUserData(String building, String name, int number) async {
    return await aptCollection.document(uid).setData({
      'building': building,
      'name': name,
      'number': number,
    });
  }



  // Apts list from snapshot
  List<Apt> _aptListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Apt(
          building: doc.data['bulding'] ?? '',
          number: doc.data['number'] ?? 0,

      );
    }).toList();
  }

  List<UserData> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return UserData(
        name: doc.data['name'] ?? '',
        building: doc.data['building'] ?? '',

      );
    }).toList();
  }


  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        building: snapshot.data['building'],
        number: snapshot.data['number']
    );
  }

  // get apts stream
  Stream<List<Apt>> get apts {
    return aptCollection.snapshots()
        .map(_aptListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return aptCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

  Stream<List<UserData>> get users {
    return aptCollection.snapshots()
        .map(_userListFromSnapshot);
  }



}
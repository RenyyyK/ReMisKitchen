import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:remi_kitchen/models/recipe.dart';

class DatabaseService{

  
  final String uid;
  DatabaseService( this.uid );

    // collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  
  Future<void> updateUserData(String name, List<Recipe> favorites) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'favorites': favorites,
    });
  }

  // get brews stream
  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}
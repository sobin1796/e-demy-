import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:morph/cousredetail/videoplayer.dart';

class instance {
  final User? user = FirebaseAuth.instance.currentUser;

  FirebaseAuth auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
}

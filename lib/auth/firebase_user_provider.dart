import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class CaunselFirebaseUser {
  CaunselFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

CaunselFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CaunselFirebaseUser> caunselFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<CaunselFirebaseUser>(
      (user) {
        currentUser = CaunselFirebaseUser(user);
        return currentUser!;
      },
    );

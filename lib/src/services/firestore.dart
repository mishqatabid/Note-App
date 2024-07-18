import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:notepad/src/services/models.dart';
import 'auth.dart';

class FirestoreService {
  String addNote(String title, String note) {
    final now = DateTime.now();
    final docRef = FirebaseFirestore.instance.collection("notes").doc();
    final data = <String, dynamic>{
      "datecreated": DateFormat.yMMMMd('en_US').add_jm().format(now),
      "noteid": docRef.id,
      "uid": AuthService().user?.uid,
      "title": title,
      "note": note,
      "lastupdated": DateFormat.yMd().format(now),
      "timestamp": DateTime.now(),
      "pfp": AuthService().user?.photoURL ??
          "https://pbs.twimg.com/media/FkXvaBSX0AoAXcB.jpg"
    };

    docRef.set(data, SetOptions(merge: true)).then(
        (value) => log("DocumentSnapshot successfully updated!"),
        onError: (e) => log("Error updating document $e"));
    return docRef.id;
  }

  Future<void> updateNote(String title, String note, String noteid) {
    final now = DateTime.now();
    final ref = FirebaseFirestore.instance.collection("notes").doc(noteid);
    var data = {
      "uid": AuthService().user?.uid,
      "title": title,
      "note": note,
      "lastupdated": DateFormat.yMd().format(now),
      "timestamp": DateTime.now(),
      "pfp": AuthService().user?.photoURL ??
          "https://pbs.twimg.com/media/FkXvaBSX0AoAXcB.jpg"
    };
    return ref.set(data, SetOptions(merge: true));
  }

  Future<void> deleteNote(String noteid) {
    final ref = FirebaseFirestore.instance.collection("notes").doc(noteid);
    return ref.delete();
  }

  Future<List<Notes>> getUserNotes() async {
    var ref = FirebaseFirestore.instance
        .collection('notes')
        .where("uid", isEqualTo: AuthService().user?.uid)
        .orderBy("timestamp", descending: true); // truckers/smthng
    var snapshot =
        await ref.get(); // get gets a document only once (not realtime)
    var data = snapshot.docs.map((s) => s.data()); // foreach loop is used
    var notes = data.map((d) => Notes.fromJson(d));
    // log(notes.toString());
    return notes.toList();
  }

  Future<void> createUserDoc() async {
    final ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid); // links/some-unique-id

    var data = {'notes_list'};

    await ref.set(data as Map<String, dynamic>,
        SetOptions(merge: true)); // creates the document in firestore
  }
}

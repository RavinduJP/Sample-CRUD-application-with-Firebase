import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
// get collection of notes
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

// CREATE : add a new note
  Future<void> addNote(String note) {
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }

// READ : get note from database

// UPDATE : update a note by given ID

// DELETE : delete a note by given ID
}




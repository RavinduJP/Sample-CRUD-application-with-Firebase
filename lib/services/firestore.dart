import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
// get collection of notes
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');
  // final CollectionReference users = FirebaseFirestore.instance.collection('users');

// CREATE : add a new note, associating it with the user's ID
  Future<void> addNote(String userId, String note) {
    return notes.add({
      'note': note,
      'userId': userId, // Associated the note with the authenticated user
      'timestamp': Timestamp.now(),
    });
  }

// READ : get note from database
  Future<QuerySnapshot> getNotesStream(String userId) {
    return notes
   
        .where('userId', isEqualTo: userId)
       // .orderBy('timestamp')
        .get();
  }

// UPDATE : update a note by given ID
  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

// DELETE : delete a note by given ID
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}

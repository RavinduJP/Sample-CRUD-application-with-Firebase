import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample_crud/services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController noteController = TextEditingController();

  void openNoteBox({String? docID}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: noteController,
              ),
              actions: [
                //button to save
                ElevatedButton(
                  onPressed: () {
                    //add a new note
                    if (docID == null) {
                      firestoreService.addNote(noteController.text);
                    }
                    else {
                      firestoreService.updateNote(docID, noteController.text);
                    }
                    // clear the text controller
                    noteController.clear();
                    // close the box
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          // if we have data, get all the data
          if (snapshot.hasData) {
            List noteList = snapshot.data!.docs;

            // display as a list
            return ListView.builder(
              itemCount: noteList.length,
              itemBuilder: (context, index) {
                // get each individual doc
                DocumentSnapshot documentSnapshot = noteList[index];
                String docID = documentSnapshot.id;

                // get more from each doc
                Map<String, dynamic> data =
                    documentSnapshot.data() as Map<String, dynamic>;
                String noteText = data['note'];
                // dispaly as a list tile
                return ListTile(
                  title: Text(noteText),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // update button
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => openNoteBox(docID: docID),
                      ),
                      // delete button
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => firestoreService.deleteNote(docID),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Text("No Notes...");
          }
        },
      ),
    );
  }
}

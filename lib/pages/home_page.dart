import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  User? currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser;
  }

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
              if (currentUser != null) {
                String userId = currentUser!.uid;
                if (docID == null) {
                  setState(() {
                    firestoreService.addNote(userId, noteController.text);
                  });
                } else {
                  setState(() {
                    firestoreService.updateNote(docID, noteController.text);
                  });
                }
                // clear the text controller
                noteController.clear();
                // close the box
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void deleteConfirm({required String docID}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text('Are you sure?'),
              actions: [
                //buttons to confirmation
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('No'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (docID != null) {
                          setState(() {
                            firestoreService.deleteNote(docID);
                          });
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Yes'),
                    ),
                  ],
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
      body: FutureBuilder<QuerySnapshot>(
        future: firestoreService.getNotesStream(currentUser!.uid),
        builder: (context, snapshot) {
          print("USER ID:::: ${currentUser!.uid}");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            print("SOME ERROR OCCURED::: ${snapshot.error}");
            return Text("SOME ERROR OCCURED::: ${snapshot.error}");
          }

          // if we have data, get all the data
          else if (snapshot.hasData) {
            List noteList = snapshot.data!.docs;
            print("noteList==: ${noteList[0]['note']}");
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
                          onPressed: () => deleteConfirm(docID: docID)),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text("NoData"),
            );
          }
        },
      ),
    );
  }
}

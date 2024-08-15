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

  void openNoteBox() {
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
                    firestoreService.addNote(noteController.text);
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
    );
  }
}

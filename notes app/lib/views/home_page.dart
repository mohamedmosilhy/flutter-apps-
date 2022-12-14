import 'package:flutter/material.dart';
import 'package:notes/viewmodels/notes_manager.dart';
import 'package:notes/models/note.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => MyHomePagestate();
}

class MyHomePagestate extends State<MyHomePage> {
  final NotesManager _notesManager = NotesManager();

  final TextEditingController _textController = TextEditingController();
  String newNote = "";

  void _handelNotes() {
    setState(() {
      _notesManager.addNote(newNote);
      _textController.clear();
    });
  }

  void _handelRemoveNotes(Note note) {
    setState(() {
      _notesManager.removeNote(note);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notes App")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(label: Text("Add New Note")),
              onSubmitted: (String newText) {
                _handelNotes();
              },
              onChanged: (String newText) {
                setState(() {
                  newNote = newText;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _notesManager.notes.length,
              itemBuilder: (context, index) {
                return Dismissible(
                    key: ValueKey(_notesManager.notes[index]),
                    onDismissed: (direction) {
                      _handelRemoveNotes(_notesManager.notes[index]);
                    },
                    child: ListTile(
                      title: Text(_notesManager.notes[index].text),
                      subtitle:
                          Text(_notesManager.notes[index].date.toString()),
                    ));
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _handelNotes();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

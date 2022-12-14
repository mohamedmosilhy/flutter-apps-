import 'package:notes/models/note.dart';

class NotesManager {
  List<Note> notes = [];

  void addNote(String text) {
    Note note = Note(text, DateTime.now());
    notes.add(note);
  }

  void removeNote(Note note) {
    notes.remove(note);
  }
}

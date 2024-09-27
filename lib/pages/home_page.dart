import 'package:flutter/material.dart';
import 'create_note_page.dart';
import 'settings_page.dart';
import 'note_details_page.dart';
import '../models/note.dart';
import '../widgets/note_card.dart';
import '../themes/theme.dart';

class HomePage extends StatefulWidget {
  final Function(ThemeData) onThemeChanged;

  const HomePage({super.key, required this.onThemeChanged});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Note> _notes = [];

  void _addNote(Note note) {
    setState(() {
      _notes.add(note);
    });
  }

  void _deleteNote(int index) {
    setState(() {
      _notes.removeAt(index);
    });
  }

  void _updateTheme(Color color) {
    widget.onThemeChanged(createCustomTheme(color));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ColorNote'),
        backgroundColor: Colors.blue[300],
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => SettingsPage(
                          onThemeChanged: _updateTheme,
                        )),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _notes.isEmpty
                ? const Center(
                    child: Text(
                      'No notes yet. Create a new one!',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _notes.length,
                    itemBuilder: (context, index) {
                      return NoteCard(
                        note: _notes[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NoteDetailsPage(note: _notes[index]),
                            ),
                          );
                        },
                        onDelete: () => _deleteNote(index),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[100],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: const Text('Create New Note'),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateNotePage()),
                );
                if (result != null && result is Note) {
                  _addNote(result); // Menambahkan catatan ke daftar
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

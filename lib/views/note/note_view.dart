import 'package:aplikasi_5sia5_mobile3/controllers/note_controller.dart';
import 'package:aplikasi_5sia5_mobile3/models/node_model.dart';
import 'package:aplikasi_5sia5_mobile3/views/login_view.dart';
import 'package:aplikasi_5sia5_mobile3/views/note/create_note_view.dart';
import 'package:aplikasi_5sia5_mobile3/views/note/update_note_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteView extends StatefulWidget {
  const NoteView({super.key});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  final noteController = NoteController();

  @override
  void initState() {
    super.initState();
    noteController.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text('Notes App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginView(),
                  ),
                  (route) => false,
                );
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Search Note",
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                fillColor: Colors.grey.withAlpha(40),
                filled: true,
                contentPadding: EdgeInsets.only(top: 13),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<NoteModel>>(
                future: noteController.notes,
                builder: (BuildContext context,
                    AsyncSnapshot<List<NoteModel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("Data Kosong"));
                  } else {
                    final items = snapshot.data!;
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final note = items[index];
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            elevation: 4,
                            shadowColor: Colors.black.withAlpha(124),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 6),
                              title: Text(
                                note.noteTitle,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              subtitle: Text(
                                '${note.noteContent}\n\n${DateFormat("yMMMd").format(DateTime.parse(note.createdAt))}',
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 13),
                              ),
                              onTap: () {
                                // Navigasi ke halaman lihat/update note
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UpdateNoteView(note: note),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateNoteView(),
            )),
        child: Icon(Icons.add),
      ),
    );
  }
}

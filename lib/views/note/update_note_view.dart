import 'package:aplikasi_5sia5_mobile3/controllers/note_controller.dart';
import 'package:aplikasi_5sia5_mobile3/models/node_model.dart';
import 'package:flutter/material.dart';

class UpdateNoteView extends StatelessWidget {
  final NoteModel note;

  const UpdateNoteView({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final noteController = NoteController();
    noteController.titleController.text = note.noteTitle;
    noteController.contentController.text = note.noteContent;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text('Edit Note'),
        actions: [
          IconButton(
              onPressed: () => noteController.prosesUpdateData(context,
                  noteId: note.noteId!),
              icon: Icon(Icons.check))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: noteController.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: noteController.titleController,
                validator: (value) =>
                    noteController.cekValidasi(value, label: 'Title'),
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Title",
                  prefixIcon: Icon(Icons.title),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withAlpha(40),
                  filled: true,
                  contentPadding: EdgeInsets.only(top: 13),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: noteController.contentController,
                validator: (value) =>
                    noteController.cekValidasi(value, label: 'Content'),
                onFieldSubmitted: (_) =>
                    noteController.prosesCreateData(context),
                maxLines: 5,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: "Content",
                  prefixIcon: Icon(Icons.notes),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withAlpha(40),
                  filled: true,
                  contentPadding: EdgeInsets.only(top: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

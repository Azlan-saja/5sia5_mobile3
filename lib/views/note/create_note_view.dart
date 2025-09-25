import 'package:aplikasi_5sia5_mobile3/controllers/note_controller.dart';
import 'package:flutter/material.dart';

class CreateNoteView extends StatelessWidget {
  const CreateNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    final noteController = NoteController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text('Create Note'),
        actions: [
          IconButton(
              onPressed: () => noteController.prosesCreateData(context),
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

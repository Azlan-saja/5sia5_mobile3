import 'package:aplikasi_5sia5_mobile3/database/database_helper.dart';
import 'package:aplikasi_5sia5_mobile3/models/node_model.dart';
import 'package:aplikasi_5sia5_mobile3/views/note/note_view.dart';
import 'package:flutter/material.dart';

class NoteController {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final db = DatabaseHelper();

  late DatabaseHelper handler;
  late Future<List<NoteModel>> notes;

  init() {
    handler = DatabaseHelper();
    notes = handler.getNotes();
  }

  String? cekValidasi(String? value, {required String label}) {
    if (value!.isEmpty) {
      return '$label wajib diisi';
    }
    return null;
  }

  Future prosesCreateData(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    try {
      int result = await db.createNote(
        NoteModel(
          noteTitle: titleController.text,
          noteContent: contentController.text,
          createdAt: DateTime.now().toIso8601String(),
        ),
      );

      if (!context.mounted) return;

      if (result > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Note created successfully!'),
            backgroundColor: Colors.teal[400],
            behavior: SnackBarBehavior.floating,
          ),
        );
        // Navigasi ke halaman Notes
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const NoteView()),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to create note. Please try again.'),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred while creating the note.'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future prosesUpdateData(BuildContext context, {required int noteId}) async {
    if (!formKey.currentState!.validate()) return;

    try {
      int result = await db.updateNote(
        titleController.text,
        contentController.text,
        noteId,
      );

      if (!context.mounted) return;

      if (result > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Perubahan Berhasil Disimpan!'),
            backgroundColor: Colors.teal[400],
            behavior: SnackBarBehavior.floating,
          ),
        );
        // Navigasi ke halaman Notes
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const NoteView()),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to update note. Please try again.'),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred while update the note.'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}

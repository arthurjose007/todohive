// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todohive/controller/function.dart';
import 'package:todohive/model/model.dart';
import 'package:todohive/screen/todohome.dart';

class UpdateScreen extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;

  UpdateScreen(
      {required this.index, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(text: title);
    TextEditingController subtitleController =
        TextEditingController(text: subtitle);

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: subtitleController,
              decoration: InputDecoration(labelText: 'Subtitle'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                update(index, titleController.text, subtitleController.text);
                Navigator.pop(context); // Navigate back after updating

                // Call update function here
                // You can access the updated values using titleController.text and subtitleController.text
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> update(int id, String newTitle, String newSubtitle) async {
    final studentDB = await Hive.openBox<Todolist>('student_db');
    Todolist updatedItem = Todolist(
      id: id,
      title: newTitle,
      subtitle: newSubtitle,
    );
    await studentDB.putAt(id, updatedItem);
    getalldetails(); // Refresh the list after updating
  }
}

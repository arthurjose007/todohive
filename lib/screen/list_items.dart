import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:todohive/controller/function.dart';
import 'package:todohive/model/model.dart';

class listitem extends StatelessWidget {
  listitem({super.key});
   TextEditingController titlecontroler = TextEditingController();
   TextEditingController subcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: titlecontroler,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'titletitle'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: subcontroler,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'subinput'),
          ),
          ElevatedButton.icon(
            label: const Text('Add Task'),
            onPressed: () {
              final _name = titlecontroler.text.trim();
              final _age = subcontroler.text.trim();
              if (_name.isEmpty || _age.isEmpty) {
                return;
              }
              final student = Todolist(subtitle: _age, title: _name);
              adds(student);

              print('hello');
              titlecontroler.clear();
              subcontroler.clear();
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}

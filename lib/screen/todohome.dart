import 'package:flutter/material.dart';
import 'package:todohive/controller/function.dart';
import 'package:todohive/screen/list_items.dart';
import 'package:todohive/screen/listbuilder.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    getalldetails();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: const Text('To Do'),
      ),
      body: Column(
        children: [
          listitem(),
          const Expanded(child: itemsPage()),
        ],
      ),
    );
  }
}

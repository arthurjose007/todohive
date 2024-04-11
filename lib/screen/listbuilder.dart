import 'dart:js_util';
import 'package:todohive/screen/list_items.dart';
import 'package:flutter/material.dart';
import 'package:todohive/controller/function.dart';
import 'package:todohive/model/model.dart';
import 'package:todohive/screen/up.dart';

class itemsPage extends StatelessWidget {
  const itemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotiferlist,
      builder: (BuildContext ctx, List<Todolist> newvalue, Widget? child) {
        return ListView.separated(
            itemBuilder: (context, index) {
              final data = newvalue[index];
              return ListTile(
                tileColor: Colors.grey,
                title: Text(data.title),
                subtitle: Text(data.subtitle),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return UpdateScreen(
                              index: index,
                              title: data.title,
                              subtitle: data.subtitle,
                            );
                          }));
                        },
                        child: Icon(Icons.edit)),
                    InkWell(
                      onTap: () {
                        delete(index);
                      },
                      child: const Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: newvalue.length);
      },
    );
  }
}

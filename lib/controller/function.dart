import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todohive/model/model.dart';

ValueNotifier<List<Todolist>> valueNotiferlist =
    ValueNotifier<List<Todolist>>([]);
Future<void> adds(Todolist itemvalue) async {
  final studentDB = await Hive.openBox<Todolist>('student_db');
  final _id = await studentDB.add(itemvalue);
  itemvalue.id = _id;
  getalldetails();

  valueNotiferlist.value.add(itemvalue);
  valueNotiferlist.notifyListeners();
}

Future<void> getalldetails() async {
  final studentDB = await Hive.openBox<Todolist>('student_db');
  valueNotiferlist.value.clear();
  valueNotiferlist.value.addAll(studentDB.values);
  valueNotiferlist.notifyListeners();
}

Future<void> delete(int id) async {
  final studentDB = await Hive.openBox<Todolist>('student_db');
  await studentDB.deleteAt(id);
  getalldetails();
  // valueNotiferlist.value
  //     .removeWhere((element) => valueNotiferlist.value.indexOf(element) == id);
  // valueNotiferlist.notifyListeners();
  //remove(valueNotiferlist.value[indexs])
}


//**************update function is called in the ui page************************



// Future<void> editlist(int id, Todolist value) async {
//   final studentDatabase = await Hive.openBox('student_db');
//   studentDatabase.putAt(id, value);
//   getalldetails();
//   valueNotiferlist.notifyListeners();
// }


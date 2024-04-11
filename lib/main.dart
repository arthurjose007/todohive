import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todohive/model/model.dart';
import 'package:todohive/screen/todohome.dart';
import 'package:todohive/splash/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //extra

  // final diractory = await getApplicationDocumentsDirectory();
  // Hive.init(diractory.path);
  //
  Hive.initFlutter();
  if (!Hive.isAdapterRegistered(TodolistAdapter().typeId)) {
    Hive.registerAdapter(TodolistAdapter());
  }
  // Open the Hive box once in the main function
  await Hive.openBox<Todolist>('student_db');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      title: 'Flutter Demo',
      home: splash(),
      // homePage(),
    );
  }
}

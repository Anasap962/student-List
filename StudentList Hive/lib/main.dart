import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:prject_hive/fuctions/functions.dart';
import 'package:prject_hive/models/models.dart';
import 'package:prject_hive/widgets/liststudent.dart';

void main() {   
 Hive.initFlutter();
 if (!Hive.isAdapterRegistered(StudentmodelAdapter().typeId))
  {
   Hive.registerAdapter(StudentmodelAdapter());
 }

  
  
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    getAllstudent();
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ListStudent()
    );
  }
}

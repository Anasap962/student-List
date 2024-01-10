 import 'package:hive_flutter/adapters.dart';
 import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:prject_hive/models/models.dart';

 

ValueNotifier<List <Studentmodel>> studentListNotifier= ValueNotifier([]);


Future <void> addstudent(Studentmodel value)async{
  final studentCD= await Hive.openBox<Studentmodel>('student_cd');
  await studentCD.add(value);
 studentListNotifier.value.add(value);
 studentListNotifier.notifyListeners();
 
}

getAllstudent()async{
   final studentCD= await  Hive.openBox<Studentmodel>('student_cd');
   studentListNotifier.value.clear();
   studentListNotifier.value.addAll(studentCD.values);
   studentListNotifier.notifyListeners();
}

 Future <void> deleteStudent ( index)async{
  final studentCD=await  Hive.openBox <Studentmodel>('student_cd');
  studentCD.deleteAt(index);
  studentListNotifier.notifyListeners();
  getAllstudent();
 }

 Future <void> editProfile(index , Studentmodel value)async{
  final studentCD= await Hive.openBox<Studentmodel>('student_cd');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentCD.values);
   studentCD.putAt(index, value);
  studentListNotifier.notifyListeners();
 
  getAllstudent();
 }
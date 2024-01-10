import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
part 'models.g.dart';

@HiveType(typeId: 1)
class Studentmodel {


  @HiveField(0)
  final String name;
  @HiveField(1)
  final String age;
  @HiveField(2)
  final String address;
  @HiveField(3)
  final String place;
  @HiveField(4)
  final String phone;
  @HiveField(5)
  final String image;


  Studentmodel( {required this.image ,required this.name, required this.age, required this.address, required this.place, required this.phone});
  }
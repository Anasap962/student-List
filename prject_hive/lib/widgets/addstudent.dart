import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prject_hive/fuctions/functions.dart';
import 'package:prject_hive/models/models.dart';

class addddstudent extends StatefulWidget {
  const addddstudent({super.key});

  @override
  State<addddstudent> createState() => _addstudentState();
}

final _formkey = GlobalKey<FormState>();

class _addstudentState extends State<addddstudent> {
  final _namecontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _placecontroller = TextEditingController();
  final _phonecontroller = TextEditingController();
  File? _selectImg;
  String image='images/download.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.purple[50],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  CircleAvatar(backgroundImage:_selectImg!=null? FileImage(_selectImg!):AssetImage('images/download.png') as ImageProvider,
                    // backgroundColor: const Color.fromARGB(255, 28, 28, 28),
                    radius: 65,
                    
                  ),
                  
                  ElevatedButton.icon(onPressed: (){
                   _pickFromGelry(source:ImageSource.camera);
                  }, icon: Icon(Icons.camera_alt_outlined), label: Text('Camera')),
                  SizedBox(height: 5,),
                  ElevatedButton.icon(onPressed: (){
                   _pickFromGelry(source: ImageSource.gallery);
                  }, icon: Icon(Icons.photo_size_select_actual_outlined), label: Text('Gallery')),
                  SizedBox(
                    width: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'INVALID';
                      } else {
                        return null;
                      }
                    },
                    controller: _namecontroller,
                    decoration: InputDecoration(label: Text('Enter your name')),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "INVALID";
                      } else {
                        return null;
                      }
                    },
                    controller: _agecontroller,
                  
                    decoration: InputDecoration(label: Text('Enter your age')),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'INVALID';
                      } else {
                        return null;
                      }
                    },
                    controller: _addresscontroller,
                    decoration: InputDecoration(label: Text('Enter you address')),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'INVALID';
                      } else {
                        return null;
                      }
                    },
                    controller: _placecontroller,
                    decoration: InputDecoration(label: Text('Enter your place')),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'INVALID';
                      } else {
                        return null;
                      }
                    },
                    controller: _phonecontroller,
                    decoration: InputDecoration(label: Text('Enter your number')),
                  ),
                  SizedBox(
                    width: 55,
                  ),
                  TextButton(
                    style: ButtonStyle(),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        onButtonClick();
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Done'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onButtonClick() {
   
    final _name = _namecontroller.text.trim();
    final _age = _agecontroller.text.trim();
    final _address = _addresscontroller.text.trim();
    final _place = _placecontroller.text.trim();
    final _phone = _phonecontroller.text.trim();
    

    if (_name.isEmpty ||
        _age.isEmpty ||
        _address.isEmpty ||
        _place.isEmpty ||
        _phone.isEmpty) {
      return;
    }
   final _student = Studentmodel(name: _name, age: _age, address: _address, place: _place, phone: _phone, image: _selectImg==null?image:_selectImg!.path);
    addstudent(_student);
  }


  Future _pickFromGelry ( {required ImageSource source})async{
   final retunimg = await ImagePicker().pickImage(source:source);

   if (retunimg==null) {
     return ;
   }
   setState(() {
     _selectImg= File(retunimg.path);
   });
  }
 
}

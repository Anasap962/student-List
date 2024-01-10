

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prject_hive/fuctions/functions.dart';
import 'package:prject_hive/models/models.dart';


class EditScreen extends StatefulWidget {
  final String name;
  final String age;
  final String address;
  final String place;
  final String phone;
  int index;
  dynamic imagepath;
  EditScreen(
      {super.key,
      required this.name,
      required this.age,
      required this.address,
      required this.place,
      required this.phone,
      required this.index,
      required this.imagepath});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  void initState() {
    _nameController.text = widget.name;
    _ageController.text = widget.age;
    _addresscontroller.text =widget.address;
    _placeController.text = widget.place;
    _phonecontroller.text = widget.phone;
    _selectImage = widget.imagepath != '' ? File(widget.imagepath) : null;
    // TODO: implement initState
    super.initState();
  }

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _placeController = TextEditingController();
  final _phonecontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  File? _selectImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(.0),
          child: Container(
            height: double.infinity,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                      ),
                      TextButton.icon(
                        onPressed: () {
                          _picImageFromGallery();
                        },
                        icon: Icon(Icons.image),
                        label: Text("GALLERY"),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          picImageFromCamera();
                        },
                        icon: Icon(Icons.camera_alt),
                        label: Text("CAMERA"),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "invalid text";
                          } else {
                            return null;
                          }
                        },
                        controller: _nameController,
                        decoration: InputDecoration(
                          label: Text("Name"),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "invalid text";
                          } else {
                            return null;
                          }
                        },
                        controller: _ageController,
                        decoration: InputDecoration(
                          label: Text("Age"),
                        ),
                      ),TextFormField(
                        validator: (value ){
                          if (value == null||value.isEmpty) {
                            return 'invalid text';   
                          }else{
                            return null;
                          }
                          
                        },
                        controller: _addresscontroller,
                        decoration: InputDecoration(
                          label: Text("Address"),
                        ),
                      ),
                      
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "invalid text";
                          } else {
                            return null;
                          }
                        },
                        controller: _placeController,
                        decoration: InputDecoration(
                          label: Text("Place"),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "invalid text";
                          } else {
                            return null;
                          }
                        },
                        controller: _phonecontroller,
                        decoration: InputDecoration(
                          label: Text("Phone"),
                        ),
                      ),
                      
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            updateChanges();
                           Navigator.of(context).pop();
                          }
                         
                        },
                        child: Text("Submit"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future updateChanges() async {
    final _newName = _nameController.text;
    final _newAge = _ageController.text;
    final _address = _addresscontroller.text;
    final _newPlace = _placeController.text;
    final _newPhone = _phonecontroller.text;
    final _newImage = _selectImage!.path;
    if (_newName.isNotEmpty ||
        _newAge.isNotEmpty ||
        _newPlace.isNotEmpty ||
        _newPhone.isNotEmpty||_address.isNotEmpty) {
      final updateData = Studentmodel(
          name: _newName,
          age: _newAge,
          address: _address,
          place: _newPlace,
          phone: _newPhone,
          image: _newImage, 
           );
      editProfile(widget.index, updateData);
    }
    return;
  }

  Future<void> _picImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) {
      return;
    }
    setState(() {
      _selectImage = File(returnImage.path);
    });
  }

  Future<void> picImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) {
      return;
    }
    setState(() {
      _selectImage = File(returnImage.path);
    });
  }
}
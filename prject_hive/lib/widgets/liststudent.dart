
import 'package:flutter/material.dart';
import 'package:prject_hive/fuctions/functions.dart';
import 'package:prject_hive/models/models.dart';
import 'package:prject_hive/widgets/addstudent.dart';
import 'package:prject_hive/widgets/edit.dart';
import 'package:prject_hive/widgets/profile.dart';

class ListStudent extends StatefulWidget {
  ListStudent({Key? key}) : super(key: key);

  @override
  State<ListStudent> createState() => _ListStudentState();
}

class _ListStudentState extends State<ListStudent> {
  String search = '';
  List<Studentmodel> searchedList = [];


  void searchListUpdate() {
   
    setState(() {
      searchedList = studentListNotifier.value
          .where((Studentmodel student) =>
              student.name.toLowerCase().contains(search.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
   
    getAllstudent(); 

    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
          'STUDENT LIST',
          style: TextStyle(color: Colors.white, fontSize: 33),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        titleSpacing: 10,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.verified_user_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
      
          TextFormField(
            decoration: InputDecoration( hintText: 'search',
            
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                search = value;
              });
              searchListUpdate();
            },
            
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: studentListNotifier,
              builder: (BuildContext context, List<Studentmodel> studentList, Widget? child) {
               
                return search.isNotEmpty
                    ? ListView.separated(
                        itemBuilder: (ctx, index) {
                          final data = searchedList[index];
                          return buildListTile(data, index);
                        },
                        separatorBuilder: (ctx, index) {
                          return Divider();
                        },
                        itemCount: searchedList.length,
                      )
                    : ListView.separated(
                        itemBuilder: (ctx, index) {
                          final data = studentList[index];
                          return buildListTile(data, index);
                        },
                        separatorBuilder: (ctx, index) {
                          return Divider();
                        },
                        itemCount: studentList.length,
                      );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => addddstudent()));
        },
        child: Icon(Icons.person_add_alt_rounded),
      ),
    );
  }

 
  ListTile buildListTile(Studentmodel data, int index) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => profile(
            name: data.name,
            age: data.age,
            address: data.address,
            place: data.place,
            phone: data.phone,
            image: data.image ?? '',
          ),
        ));
      },
      title: Text(data.name),
      subtitle: Text(data.age),
      leading: CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage(data.image),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              deleteStudent(index);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => EditScreen(
                  name: data.name,
                  age: data.age,
                  address: data.address,
                  place: data.place,
                  phone: data.phone,
                  imagepath: data.image,
                  index: index,
                ),
              ));
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}

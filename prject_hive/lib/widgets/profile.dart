import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile(
      {super.key,
      required this.name,
      required this.age,
      required this.address,
      required this.place,
      required this.phone, 
       this.image});
  final String name;
  final String age;
  final String address;
  final String place;
  final String phone;
    final String? image;


  @override
  Widget build(BuildContext context) {


    return Scaffold(backgroundColor: Colors.purple[50],
        body: Center(
              child: Container(
        color: Colors.purple,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 10,
          ),
          CircleAvatar(
            backgroundImage: AssetImage(image!),
            radius: 60,
          ),
          const SizedBox(
            height: 16,
          ),
          Card(
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
            ),
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Name : $name',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Age : $age',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            color: Colors.white,
            child: Column(
              children: [ 
                Container(height: 50,
                  
                  child: Center(
                    child: Text(
                      'address : $address',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Card(
            color: Colors.white,
            // shape: RoundedRectangleBorder(
            //     borderRadius:
            //         BorderRadius.vertical(bottom: Radius.circular(45))),
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Place : $place',
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card( color: Colors.white,
             shape: const RoundedRectangleBorder(
                 borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(45))),
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Phone : $phone',
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),const SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: const Text('Done'))
            
          
        ]
        ),
              ),
            ));
  }
}

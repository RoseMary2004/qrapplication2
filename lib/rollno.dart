import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:qrapplication/Profile.dart';

class Rollno extends StatefulWidget {
  const Rollno({Key? key}) : super(key: key);

  @override
  State<Rollno> createState() => _RollnoState();
}

class _RollnoState extends State<Rollno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      const TextField(
        decoration:  InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width:1,color: Colors.white)
            ),
            labelText: "Roll No"),
      ),
            TextButton(
    onPressed: () {Navigator.push(context, MaterialPageRoute(builder:(context)=>const Profile() )
    );},
    child: Text('login'),
    style: ButtonStyle(
    foregroundColor:
    MaterialStateProperty.all<Color>(Colors.white)),
    ),

]
    ),
    );


  }
}



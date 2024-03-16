import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
        child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.network(
        "https://cdn-icons-png.freepik.com/512/9668/9668879.png",width: 200,height: 200,),
    SizedBox(height: 20, width: 25,),
          Text("Rose",style: TextStyle(
            fontSize: 30,color: Colors.teal
          ),),

    ]
    ),
        ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'QrCode.dart';
import 'main.dart';
class RegistrationPg extends StatefulWidget {
  const RegistrationPg({Key? key}) : super(key: key);

  @override
  State<RegistrationPg> createState() => _RegistrationPgState();
}

class _RegistrationPgState extends State<RegistrationPg> {
   TextEditingController name=TextEditingController();
   TextEditingController rollno=TextEditingController();
   TextEditingController email=TextEditingController();
   TextEditingController password=TextEditingController();
   void register()async{
     print(name.text);
     print(rollno.text);
     print(email.text);
     print(password.text);
     Uri uri=Uri.parse('https://scnner-web.onrender.com/api/register');
     var response=await http.post(uri,
     headers:<String,String>{
       'Content-Type':'application/json;charset=UTF-8',
     },
     body: jsonEncode({
       'name':name.text,
       'rollno':rollno.text,
       'email':email.text,
       'password':password.text,

     })
     );
     print(response.statusCode);
     print(response.body);
     var data=jsonDecode(response.body);
     print(data["message"]);
     if(response.statusCode==200){
       Navigator.push(context, MaterialPageRoute(builder:(context)=>const LoginPage ()),
     );
     }else{
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(data["message"])));

     }
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const  Text('Registration',
          style: TextStyle(height: 5, fontSize: 25, color: Colors.white)),
       TextField(
        controller: name,
        decoration:  InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width:1,color: Colors.white)
            ),
            labelText: "Enter Your Name"),
      ),
      const SizedBox(
        height: 20,
      ),
       TextField(
        controller: rollno,
        decoration:  InputDecoration(
            labelText: "Enter Your Roll No",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.white),
            )),
      ),
            const SizedBox(
              height: 20,
            ),
             TextField(
              controller: email,
              decoration:  InputDecoration(
                  labelText: "Enter Your Email",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.white),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
             TextField(
              controller: password,
              decoration:  InputDecoration(
                  labelText: "Enter Your Password",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.white),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder:(context)=>const QrCode() )
              );
              register();
              },
              child: Text('Register'),
              style: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.white)),
            ),

      ],
    )
    );
  }
}

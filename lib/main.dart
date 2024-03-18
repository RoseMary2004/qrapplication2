import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'QrCode.dart';
import 'Registrationpg.dart';

void main() {
  runApp(const MaterialApp(
    home: const LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {


  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  TextEditingController RollNo=TextEditingController();
  TextEditingController Password=TextEditingController();

    Future<void> login() async {
      Uri url = Uri.parse('https://scnner-web.onrender.com/api/login');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({'rollno': RollNo.text, 'password': Password.text}));


      print(response.statusCode);
      print(response.body);
      var data = jsonDecode(response.body);
      print(data["message"]);
      if (response.statusCode == 200) {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => const QrCode ()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data["message"])));
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const  Text('Login',
              style: TextStyle(height: 5, fontSize: 25, color: Colors.white)),
          TextField(
           controller: RollNo,
            decoration:  InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width:1,color: Colors.white)
                ),
                labelText: "Enter Your Roll No"),
          ),
         const SizedBox(
            height: 20,
          ),
          TextField(
           controller: Password,
            decoration:  InputDecoration(
                labelText: "Enter Your Password",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.white),
                )),
          ),
          TextButton(
            onPressed: () {
              login();
    },

            child: Text('Login'),
            style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
          ),
          Text(
            "OR",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>const RegistrationPg() )
                );
              },
              child: Text('Register'),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal))),
        ],
      ),

    );
  }
}

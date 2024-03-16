import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const  Text('Login',
              style: TextStyle(height: 5, fontSize: 25, color: Colors.white)),
         const TextField(
            decoration:  InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width:1,color: Colors.white)
                ),
                labelText: "Enter Your Roll No"),
          ),
         const SizedBox(
            height: 20,
          ),
         const TextField(
            decoration:  InputDecoration(
                labelText: "Enter Your Password",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.white),
                )),
          ),
          TextButton(
            onPressed: () {},
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

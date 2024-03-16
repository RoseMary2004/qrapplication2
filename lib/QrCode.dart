import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrapplication/rollno.dart';

class QrCode extends StatefulWidget {
  const QrCode({Key? key}) : super(key: key);

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
     child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              "https://cdn.icon-icons.com/icons2/1154/PNG/512/1486564400-account_81513.png",width: 200,height: 200,),
          SizedBox(height: 20, width: 25,),
          QrImageView(
            data: '1234567890',
            version: QrVersions.auto,
            size: 400.0,
          ),
          SizedBox(height: 80,),
          TextButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder:(context)=>const Rollno() )
              );},
              child: Text('Scan'),

              style: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.teal))),
        ],
      ),
      ),
    );
  }
}

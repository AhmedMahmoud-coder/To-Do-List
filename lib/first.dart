import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_1/Home.dart';
// ignore: unused_import
import 'package:flutter_application_1/sign_in.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 141, 189),
        title: Text("First page"),
        actions: [
          IconButton(onPressed: ()
         async {
            await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushAndRemoveUntil(
               MaterialPageRoute(builder: (context) => const Home()),
                (route) => false, // السطر ده معناه: امسح كل اللي فات
              );


          }, icon: Icon(Icons.exit_to_app))
        ],
      ),
    );
  }
}
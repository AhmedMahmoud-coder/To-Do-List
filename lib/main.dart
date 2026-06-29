import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/first.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// 1. الكلاس الأساسي اللي بيورث من StatefulWidget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// 2. كلاس الـ State اللي بنكتب جواه اللوجيك والديزاين
class _MyAppState extends State<MyApp> {
  
  @override
  void initState() {
    super.initState(); // السطر ده إجباري ومهم جداً يتكتب أول حاجة جوه الـ initState
    
    // الكود بتاعك زي ما هو
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        // ignore: avoid_print
        print('User is currently signed out!');
      } else {
        // ignore: avoid_print
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:FirebaseAuth.instance.currentUser==null? const Home():First(), 
    );
  }
}
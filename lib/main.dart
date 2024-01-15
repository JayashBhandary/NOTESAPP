import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:notestaking/pages/HomePage.dart';
import 'package:notestaking/pages/LoginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primaryColor: Colors.black
      ),
      home: const AuthHolder(),
    );
  }
}


class AuthHolder extends StatefulWidget {
  const AuthHolder({super.key});

  @override
  State<AuthHolder> createState() => _AuthHolderState();
}

class _AuthHolderState extends State<AuthHolder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.connectionState != ConnectionState.active){
          return const Center(child: CircularProgressIndicator(),);
        }

        final user = snapshot.data;
        if(user != null) {
          return const MyHomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
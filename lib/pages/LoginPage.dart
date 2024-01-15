import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var loading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    print(
        'Username: ${emailController.text}, Password: ${passwordController.text}');

    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                Image.network(
                  'https://vpmrzshahcollege.edu.in/images/collegelogo.png',
                  width: 150,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "VPM'S R. Z. SHAH COLLEGE",
                  style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'NOTES APP',
                  style: TextStyle(
                      fontSize: 50,
                      letterSpacing: 4,
                      fontWeight: FontWeight.w100),
                ),
              ],
            ),
            const SizedBox(
              height: 200.0,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email'),
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(
              height: 140.0,
            ),
            CupertinoButton(
              minSize: 50,
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
              onPressed: () {
                setState(() {
                  loading = true;
                });
                login();
              },
              child: loading == true
                  ? const CircularProgressIndicator(
                    backgroundColor: Colors.white,
                      strokeWidth: 2,
                    )
                  : const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

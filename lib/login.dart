import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


final usrnm_cntrlr=TextEditingController();
final pswrd_cntrlr=TextEditingController();
class _LoginPageState extends State<LoginPage> {

  @override
  void disposal() {
    usrnm_cntrlr.dispose();
    pswrd_cntrlr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                        color: Colors.black
                    )
                ),
                child: TextField(
                  controller: usrnm_cntrlr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                      hintText: 'UserName',
                      hintStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 25,
                      ),
                      border: InputBorder.none
                  ),
                ),
                width: MediaQuery.of(context).size.width*.8,
              ),
            ),

            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                        color: Colors.black
                    )
                ),
                child: TextField(
                  controller: pswrd_cntrlr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 25,
                      ),
                      border: InputBorder.none
                  ),
                ),
                width: MediaQuery.of(context).size.width*.8,
              ),
            ),

            ElevatedButton(
              onPressed: (){
                FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: usrnm_cntrlr.text.trim(),
                    password: pswrd_cntrlr.text.trim());
              },
              child: Text("Login"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
            ElevatedButton(
                onPressed: (){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: usrnm_cntrlr.text.trim(),
                      password: pswrd_cntrlr.text.trim());
                },
                child: Text("SignUp"),
                style: TextButton.styleFrom(
                    textStyle: TextStyle(
                      color: Colors.blue[700],
                    )
                )
            ),
          ],
        ),
      ),
    );
  }
}


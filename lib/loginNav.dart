import 'package:flutter/material.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginNav extends StatefulWidget {
  @override
  _LoginNavState createState() => _LoginNavState();
}

class _LoginNavState extends State<LoginNav> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;
  var authState = "";

  void UpdateText(text){
    setState(() {
      authState = text;
    });
  }

  //FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Container(
                    width: 150,
                    height: 120,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/indroLogo.png')),
              ),
            ),

            SizedBox(
              height: 15,
            ),
            Text(authState, style: TextStyle(color: Colors.red,)),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
                onChanged: (value){
                  setState((){
                    _email = value.trim();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
                  onChanged: (value){
                    setState((){
                      _password = value.trim();
                    });
                  },
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.orange, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () async {
                  print(_email);

                  try {
                    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _email, password: _password
                    );
                    UpdateText('');
                    User? user = FirebaseAuth.instance.currentUser;
                    if (user!= null && user.emailVerified) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Home()));
                    }
                    else{
                      UpdateText('Please verify email');
                    }

                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      UpdateText('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      UpdateText('Wrong password provided for that user.');
                    }
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.orangeAccent, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _email, password: _password
                    );
                    User? user = FirebaseAuth.instance.currentUser;
                    if (user!= null && !user.emailVerified) {
                      await user.sendEmailVerification();
                    }
                    UpdateText('Email verification required');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      UpdateText('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      UpdateText('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text(
                  'Create Account',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            //SizedBox(
            //  height: 130,
            //),
            //FlatButton(
              //onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              //},
              //child: Text(
                //'Forgot Password',
                //style: TextStyle(color: Colors.blue, fontSize: 15),
              //),
            //),
            //Text('New User? Create Account')
          ],
        ),
      ),
    );
  }
}
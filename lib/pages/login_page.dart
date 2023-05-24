import 'package:flutter/material.dart';
import 'create_account_page.dart';
import 'forget_password_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final List<TextEditingController> _controller =
      List.generate(2, (i) => TextEditingController());
  // final email = 'kt@mail.com';
  // final password = 'aaaa';
  final email = '';
  final password = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    for (TextEditingController i in _controller) {
      i.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset('assets/images/flutter-logo.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _controller[0],
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _controller[1],
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            TextButton(
              onPressed: () {
                //TODO FORGOT PASSWORD SCREEN GOES HERE
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ForgetPassword()));
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  if (_controller[0].text == email &&
                      _controller[1].text == password) {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => HomePage()));
                  } else {
                    showDialog(
                        context: context,
                        builder: ((context) {
                          return AlertDialog(
                              content: Text("Incorrect username or password!"));
                        }));
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            GestureDetector(
              child: Text('New User? Create Account'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CreateAccount()));
              },
            )
          ],
        ),
      ),
    );
  }
}

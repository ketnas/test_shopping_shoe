import 'package:flutter/material.dart';
// import '../main_shopping.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  _CreateAccount createState() => _CreateAccount();
}

class _CreateAccount extends State<CreateAccount> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Create Account"),
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
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 0, bottom: 20),
              // padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 0, bottom: 20),
              // padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                controller: _password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter Password for Your Account'),
              ),
            ),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text("Creating New Account"),
                            content: Text(
                                "Your Email: ${_email.text}\nYour Password: ${_password.text}"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK"))
                            ],
                          ));
                },
                child: Text(
                  'Create Account',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}

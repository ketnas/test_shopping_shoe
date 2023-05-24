import 'package:flutter/material.dart';
// import '../main_shopping.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  _ForgetPassword createState() => _ForgetPassword();
}

class _ForgetPassword extends State<ForgetPassword> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Forget Password"),
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
                controller: _controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  // debugPrint("${_controller.text}");
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text("Request New Password"),
                            content: Text(
                                "Sending email to ${_controller.text}. \nPlease Check your email."),
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
                  'Send Email',
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

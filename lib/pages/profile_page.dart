import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MyHomePage(title: 'Profile');
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    // final String imgUrl =
    //     'https://images.mid-day.com/images/images/2023/feb/blackpinkroseresized_d.jpg';

    final String name = "Test Test";
    final String email = "kt@mail.com";

    return new Stack(
      children: <Widget>[
        new Container(
          color: Colors.blue,
        ),
        new Image.asset('assets/images/user.png'),
        // Image.network(
        //   imgUrl,
        //   fit: BoxFit.fill,
        // ),
        new BackdropFilter(
            filter: new ui.ImageFilter.blur(
              sigmaX: 6.0,
              sigmaY: 6.0,
            ),
            child: new Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.9),
                // borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            )),
        new Scaffold(
            appBar: new AppBar(
              title: new Text(widget.title.toString()),
              centerTitle: false,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              actions: <Widget>[
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.clear))
              ],
            ),
            backgroundColor: Colors.transparent,
            body: new Center(
              child: new Column(
                children: <Widget>[
                  new SizedBox(
                    height: _height / 12,
                  ),
                  new CircleAvatar(
                    radius: _width < _height ? _width / 4 : _height / 4,
                    // backgroundImage: NetworkImage(imgUrl),
                    child: Image.asset('assets/images/user.png'),
                  ),
                  new SizedBox(
                    height: _height / 25.0,
                  ),
                  new Text(
                    name,
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _width / 15,
                        color: Colors.white),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(
                        top: _height / 30, left: _width / 8, right: _width / 8),
                    child: new Text(
                      "Email: $email",
                      style: new TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: _width / 25,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  new Divider(
                    height: _height / 30,
                    color: Colors.white,
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Widget rowCell(int count, String type) => new Expanded(
          child: new Column(
        children: <Widget>[
          new Text(
            '$count',
            style: new TextStyle(color: Colors.white),
          ),
          new Text(type,
              style: new TextStyle(
                  color: Colors.white, fontWeight: FontWeight.normal))
        ],
      ));
}

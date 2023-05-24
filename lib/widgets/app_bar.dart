import 'package:flutter/material.dart';
import '../pages/profile_page.dart';

PreferredSizeWidget? getAppBar(context, String title) {
  return AppBar(
    title: Text(title),
    automaticallyImplyLeading: true,
    actions: <Widget>[
      IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => MyProfile()));
          },
          icon: const Icon(Icons.person))
    ],
  );
}

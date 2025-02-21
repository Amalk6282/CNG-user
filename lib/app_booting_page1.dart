import 'dart:async';

import 'package:cng_users/app_booting_page2.dart';
import 'package:flutter/material.dart';

class AppBootingPage1 extends StatefulWidget {
  const AppBootingPage1({super.key});

  @override
  State<AppBootingPage1> createState() => _AppBootingPage1State();
}

class _AppBootingPage1State extends State<AppBootingPage1> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AppBootingPage2()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00A36C),
      body: Center(
          child: Text(
        'CNGify',
        style: TextStyle(fontSize: 50, color: Colors.white),
      )),
    );
  }
}

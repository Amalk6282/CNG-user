import 'package:cng_users/features/signin/login_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'home_screen.dart';

class AppBootingPage2 extends StatefulWidget {
  const AppBootingPage2({super.key});

  @override
  State<AppBootingPage2> createState() => _AppBootingPage2State();
}

class _AppBootingPage2State extends State<AppBootingPage2> {
  @override
  void initState() {
    Future.delayed(
        const Duration(
          milliseconds: 100,
        ), () {
      User? currentUser = Supabase.instance.client.auth.currentUser;
      if (currentUser != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00A36C),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
          ),
          Text(
            'CNGify',
            style: TextStyle(fontSize: 50, color: Colors.white),
          ),
          SizedBox(
            height: 350,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  minimumSize: const Size(300, 50.0)),
              child: Text(
                'GET STARTED >',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ))
        ],
      )),
    );
  }
}

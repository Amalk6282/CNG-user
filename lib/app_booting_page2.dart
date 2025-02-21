import 'package:cng_users/login_page.dart';
import 'package:flutter/material.dart';

class AppBootingPage2 extends StatefulWidget {
  const AppBootingPage2({super.key});

  @override
  State<AppBootingPage2> createState() => _AppBootingPage2State();
}

class _AppBootingPage2State extends State<AppBootingPage2> {
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

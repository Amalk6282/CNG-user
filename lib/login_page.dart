import 'package:cng_users/verification_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CNGify',
              style: TextStyle(fontSize: 40, color: Color(0xFF00A36C)),
            ),
            SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 400,
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Welcome to CNGify',
                        style: TextStyle(fontSize: 16),
                      )),
                  TextFormField(
                      decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    labelText: 'Email',
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerificationPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        minimumSize: const Size(400, 50.0),
                        backgroundColor: const Color(0xFF00A36C)),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        minimumSize: const Size(400, 50.0),
                        backgroundColor: Color(0xFFD9D9D9)),
                    child: Text(
                      'Continue with Google',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

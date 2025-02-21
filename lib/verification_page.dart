import 'package:cng_users/notification_permission.dart';
import 'package:flutter/material.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back),
                SizedBox(
                  width: 110,
                ),
                Text(
                  'Verification',
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
            SizedBox(
              height: 180,
            ),
            SizedBox(
              height: 300,
              width: 380,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Enter Verification Code',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'We have send you a 5 digit \n verification code',
                        style: TextStyle(fontSize: 20),
                      )),
                  TextFormField(
                      decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    labelText: 'Enter OTP',
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationPermission()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          minimumSize: Size(400, 50),
                          backgroundColor: Color(0xFF00A36C)),
                      child: Text(
                        'Verify',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text('Resend Code',
                          style: TextStyle(fontSize: 18, color: Colors.black)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

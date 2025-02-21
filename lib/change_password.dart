import 'package:cng_users/home_screen.dart';

import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shadowColor: Color(0xFF00A36C),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Change Password',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 50,
          ),
          Align(alignment: Alignment.topLeft, child: Text('First Name')),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter First Name',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(alignment: Alignment.topLeft, child: Text('First Name')),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter First Name',
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              // ignore: prefer_const_constructors
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        backgroundColor: Colors.white),
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    )),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        backgroundColor: const Color(0xFF00A36C)),
                    child: Text(
                      'Confirm',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}

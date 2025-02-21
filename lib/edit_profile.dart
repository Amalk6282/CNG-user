import 'package:cng_users/home_screen.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(children: [
            Text(
              'Edit Profile',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.all(Radius.circular(90))),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Upload Photo +',
                      style: TextStyle(fontSize: 25, color: Color(0xFF00A36C)),
                    ),
                  ),
                ],
              ),
            )),
            SizedBox(
              width: 300,
              height: 630,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft, child: Text('First Name')),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter First Name',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Last Name',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Last Name',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(alignment: Alignment.topLeft, child: Text('Email')),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Email',
                    ),
                  ),
                  SizedBox(
                    height: 338,
                  ),
                  ElevatedButton(
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
                          minimumSize: const Size(400, 50.0),
                          backgroundColor: const Color(0xFF00A36C)),
                      child: Text(
                        'Save',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ))
                ],
              ),
            )
          ]),
        )
      ],
    ));
  }
}

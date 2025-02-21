import 'package:cng_users/home_screen.dart';
import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )),

              height: 240,
              width: 350,
            ),
          ),
          Center(
            child: Container(
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )),

              height: 236,
              width: 346,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Text(
                      'Log Out?',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Are You sure you want to LogOut from your \n account ? Please Note this is a revocable \n action!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Row(
                      children: [
                        // ignore: prefer_const_constructors
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                minimumSize: const Size(150, 50.0),
                                backgroundColor: Colors.white),
                            child: Text(
                              'Cancel',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                minimumSize: const Size(150, 50.0),
                                backgroundColor: const Color(0xFF00A36C)),
                            child: Text(
                              'Confirm',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

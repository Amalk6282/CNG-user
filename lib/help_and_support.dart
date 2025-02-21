import 'package:cng_users/home_screen.dart';
import 'package:flutter/material.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xFF00A36C)),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Help And Support',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 30,
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
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  minimumSize: const Size(280, 50.0),
                  backgroundColor: const Color(0xFF00A36C)),
              child: Text(
                'Complaints and Feedbacks',
                style: TextStyle(fontSize: 18, color: Colors.white),
              )),
          SizedBox(
            height: 20,
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
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  minimumSize: const Size(280, 50.0),
                  backgroundColor: const Color(0xFF00A36C)),
              child: Text(
                'Privacy & Policy',
                style: TextStyle(fontSize: 18, color: Colors.white),
              )),
          SizedBox(
            height: 20,
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
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  minimumSize: const Size(280, 50.0),
                  backgroundColor: const Color(0xFF00A36C)),
              child: Text(
                'Terms And Conditions',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ))
        ],
      ),
    );
  }
}

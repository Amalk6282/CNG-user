import 'package:cng_users/home_screen.dart';
import 'package:cng_users/location_permission.dart';
import 'package:flutter/material.dart';

class NotificationPermission extends StatelessWidget {
  const NotificationPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 500,
          width: 310,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.notifications_active,
                size: 150,
                color: Colors.amber,
              ),
              Text(
                'Get Notified',
                style: TextStyle(fontSize: 50),
              ),
              Text(
                'Allow CNGify to send you push notifications when you have new messages and offers',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LocationPermission()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      minimumSize: Size(400, 50),
                      backgroundColor: Color(0xFF00A36C)),
                  child: Text(
                    'Allow',
                    style: TextStyle(fontSize: 24, color: Colors.white),
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
                    minimumSize: Size(400, 50),
                    backgroundColor: Color(0xFFD9D9D9),
                  ),
                  child: Text(
                    'Skip',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

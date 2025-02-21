import 'package:cng_users/home_screen.dart';
import 'package:flutter/material.dart';

class LocationPermission extends StatelessWidget {
  const LocationPermission({super.key});

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
                Icons.location_on_outlined,
                size: 150,
                color: Colors.black,
              ),
              Text(
                'Allow Location',
                style: TextStyle(fontSize: 45),
              ),
              Text(
                'Allow CNGify to Enable your loaction to get your Current Location',
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
                      MaterialPageRoute(builder: (context) => HomeScreen()),
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

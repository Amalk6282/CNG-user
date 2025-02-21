import 'package:cng_users/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Delete Account?',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Are You sure you want to Delete your \n account ? Please Note this is a revocable action!!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 45,
          ),
          Row(
            children: [
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
                            side: BorderSide(color: Color(0xFF00A36C)),
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
                        backgroundColor: Colors.red),
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

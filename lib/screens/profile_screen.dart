import 'package:cng_users/change_password.dart';
import 'package:cng_users/delete_account.dart';
import 'package:cng_users/edit_profile.dart';
import 'package:cng_users/help_and_support.dart';
import 'package:cng_users/home_screen.dart';
import 'package:cng_users/login_page.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          Text(
            'Profile',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.all(Radius.circular(90))),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Lucy Guest',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'lucyguest1234@gmail.com',
                        style: TextStyle(color: Colors.black54),
                      ))
                ],
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            height: 450,
            width: 350,
            child: Column(
              children: [
                ProfilePageButton(
                  iconData: Icons.edit,
                  options: 'Edit Profile',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                ),
                Spacer(),
                ProfilePageButton(
                  iconData: Icons.directions_car,
                  options: 'My Vehicle',
                  onTap: () {},
                ),
                Spacer(),
                ProfilePageButton(
                  iconData: Icons.account_balance_wallet_rounded,
                  options: 'Route Credit Wallet',
                  onTap: () {},
                ),
                Spacer(),
                ProfilePageButton(
                  iconData: Icons.lock,
                  options: ' Change Password',
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => ChangePassword());
                  },
                ),
                Spacer(),
                ProfilePageButton(
                  iconData: Icons.perm_contact_calendar_outlined,
                  options: 'Help and Support',
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => HelpAndSupport());
                  },
                ),
                Spacer(),
                ProfilePageButton(
                  iconData: Icons.delete,
                  options: 'Delete Account',
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => DeleteAccount());
                  },
                ),
                Spacer(),
                ProfilePageButton(
                  iconData: Icons.logout,
                  options: 'Log Out',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
                Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
